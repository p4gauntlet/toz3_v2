#include <cstdio>
#include <utility>

#include "lib/exceptions.h"
#include "lib/null.h"
#include "type_base.h"
#include "type_complex.h"
#include "visitor_fill_type.h"
#include "visitor_interpret.h"

namespace TOZ3 {

bool TypeVisitor::preorder(const IR::P4Program *p) {
    // Start to visit the actual AST objects
    for (const auto *o : p->objects) {
        visit(o);
    }
    return false;
}

bool TypeVisitor::preorder(const IR::Type_StructLike *t) {
    t = t->apply(DoBitFolding(state))->checkedTo<IR::Type_StructLike>();
    state->add_type(t->name.name, t);
    return false;
}

bool TypeVisitor::preorder(const IR::Type_Enum *t) {
    t = t->apply(DoBitFolding(state))->checkedTo<IR::Type_Enum>();
    // TODO: Enums are really nasty because we also need to access them
    // TODO: Simplify this.
    auto name = t->name.name;
    auto *var = state->find_var(name);
    // Every P4 program is initialized with an error namespace
    // according to the spec
    // So if the error exists, we merge
    if (var != nullptr) {
        auto *enum_instance = var->to_mut<EnumBase>();
        BUG_CHECK(enum_instance, "Unexpected enum instance %s",
                  enum_instance->to_string());
        for (const auto *member : t->members) {
            enum_instance->add_enum_member(member->name.name);
        }
    } else {
        state->add_type(name, t);
        state->declare_var(name, new EnumInstance(state, t, 0, ""), t);
    }
    return false;
}

bool TypeVisitor::preorder(const IR::Type_Error *t) {
    // TODO: Simplify this.
    t = t->apply(DoBitFolding(state))->checkedTo<IR::Type_Error>();
    auto name = t->name.name;
    auto *var = state->find_var(name);
    // Every P4 program is initialized with an error namespace
    // according to the spec
    // So if the error exists, we merge
    if (var != nullptr) {
        auto *enum_instance = var->to_mut<EnumBase>();
        BUG_CHECK(enum_instance, "Unexpected enum instance %s",
                  enum_instance->to_string());
        for (const auto *member : t->members) {
            enum_instance->add_enum_member(member->name.name);
        }
    } else {
        state->add_type(name, t);
        state->declare_var(name, new ErrorInstance(state, t, 0, ""), t);
    }
    return false;
}

bool TypeVisitor::preorder(const IR::Type_SerEnum *t) {
    // TODO: Enums are really nasty because we also need to access them
    // TODO: Simplify this.
    t = t->apply(DoBitFolding(state))->checkedTo<IR::Type_SerEnum>();
    auto name = t->name.name;
    auto *var = state->find_var(name);
    // Every P4 program is initialized with an error namespace
    // according to the spec
    // So if the error exists, we merge
    if (var != nullptr) {
        auto *enum_instance = var->to_mut<EnumBase>();
        BUG_CHECK(enum_instance, "Unexpected enum instance %s",
                  enum_instance->to_string());
        for (const auto *member : t->members) {
            enum_instance->add_enum_member(member->name.name);
        }
    } else {
        ordered_map<cstring, P4Z3Instance *> input_members;
        const auto *member_type = state->resolve_type(t->type);
        auto resolve_expr = Z3Visitor(state, false);
        for (const auto *member : t->members) {
            // TODO: Why does apply work here?
            member->value->apply(resolve_expr);
            input_members.emplace(
                member->name.name,
                state->get_expr_result()->cast_allocate(member_type));
        }
        state->add_type(name, t);
        state->declare_var(
            name, new SerEnumInstance(state, input_members, t, 0, ""), t);
    }
    return false;
}

bool TypeVisitor::preorder(const IR::Type_Extern *t) {
    t = t->apply(DoBitFolding(state))->checkedTo<IR::Type_Extern>();
    state->add_type(t->name.name, t);

    return false;
}

bool TypeVisitor::preorder(const IR::Type_Typedef *t) {
    const auto *type_clone =
        t->type->apply(DoBitFolding(state))->checkedTo<IR::Type>();
    state->add_type(t->name.name, state->resolve_type(type_clone));
    return false;
}

bool TypeVisitor::preorder(const IR::Type_Newtype *t) {
    const auto *type_clone =
        t->type->apply(DoBitFolding(state))->checkedTo<IR::Type>();
    state->add_type(t->name.name, state->resolve_type(type_clone));
    return false;
}

bool TypeVisitor::preorder(const IR::Type_Package *t) {
    t = t->apply(DoBitFolding(state))->checkedTo<IR::Type_Package>();
    state->add_type(t->name.name, state->resolve_type(t));
    return false;
}

bool TypeVisitor::preorder(const IR::Type_Parser *t) {
    t = t->apply(DoBitFolding(state))->checkedTo<IR::Type_Parser>();
    state->add_type(t->name.name, state->resolve_type(t));
    return false;
}

bool TypeVisitor::preorder(const IR::Type_Control *t) {
    t = t->apply(DoBitFolding(state))->checkedTo<IR::Type_Control>();
    state->add_type(t->name.name, state->resolve_type(t));
    return false;
}

bool TypeVisitor::preorder(const IR::P4Parser *p) {
    // Parsers can be both a var and a type
    // FIXME: Take a closer look at this...
    state->add_type(p->name.name, p);
    state->declare_var(p->name.name, new ControlInstance(state, p, {}), p);
    return false;
}

bool TypeVisitor::preorder(const IR::P4Control *c) {
    // Controls can be both a decl and a type
    // FIXME: Take a closer look at this...
    state->add_type(c->name.name, c);
    state->declare_var(c->name.name, new ControlInstance(state, c, {}), c);

    return false;
}

bool TypeVisitor::preorder(const IR::Function *f) {
    // FIXME: Overloading uses num of parameters, it should use types
    cstring overloaded_name = f->name.name;
    auto num_params = 0;
    auto num_optional_params = 0;
    for (const auto *param : f->getParameters()->parameters) {
        if (param->isOptional() || param->defaultValue != nullptr) {
            num_optional_params += 1;
        } else {
            num_params += 1;
        }
    }
    auto *decl = new P4Declaration(f);
    for (auto idx = 0; idx <= num_optional_params; ++idx) {
        // The IR has bizarre side effects when storing pointers in a map
        // FIXME: Think about how to simplify this, maybe use their vector
        auto name = overloaded_name + std::to_string(num_params + idx);
        state->declare_static_decl(name, decl);
    }
    return false;
}

bool TypeVisitor::preorder(const IR::Method *m) {
    // FIXME: Overloading uses num of parameters, it should use types
    cstring overloaded_name = m->name.name;
    auto num_params = 0;
    auto num_optional_params = 0;
    for (const auto *param : m->getParameters()->parameters) {
        if (param->isOptional() || param->defaultValue != nullptr) {
            num_optional_params += 1;
        } else {
            num_params += 1;
        }
    }
    auto *decl = new P4Declaration(m);
    for (auto idx = 0; idx <= num_optional_params; ++idx) {
        // The IR has bizarre side effects when storing pointers in a map
        // FIXME: Think about how to simplify this, maybe use their vector
        auto name = overloaded_name + std::to_string(num_params + idx);
        state->declare_static_decl(name, decl);
    }
    return false;
}

bool TypeVisitor::preorder(const IR::P4Action *a) {
    // FIXME: Overloading uses num of parameters, it should use types
    cstring overloaded_name = a->name.name;
    auto num_params = 0;
    auto num_optional_params = 0;
    for (const auto *param : a->getParameters()->parameters) {
        if (param->direction == IR::Direction::None || param->isOptional() ||
            param->defaultValue != nullptr) {
            num_optional_params += 1;
        } else {
            num_params += 1;
        }
    }
    auto *decl = new P4Declaration(a);
    cstring name_basic = overloaded_name + std::to_string(num_params);
    state->declare_static_decl(name_basic, decl);
    // The IR has bizarre side effects when storing pointers in a map
    // FIXME: Think about how to simplify this, maybe use their vector
    if (num_optional_params != 0) {
        cstring name_opt =
            overloaded_name + std::to_string(num_params + num_optional_params);
        state->declare_static_decl(name_opt, decl);
    }
    return false;
}

bool TypeVisitor::preorder(const IR::P4Table *t) {
    state->declare_static_decl(t->name.name, new P4TableInstance(state, t));
    return false;
}

bool TypeVisitor::preorder(const IR::Declaration_Instance *di) {
    auto instance_name = di->name.name;
    const IR::Type *resolved_type = state->resolve_type(di->type);
    // TODO: Figure out a way to process packages
    if (instance_name == "main" || resolved_type->is<IR::Type_Package>()) {
        // Do not execute main here just yet.
        state->declare_static_decl(instance_name, new P4Declaration(di));
    } else if (const auto *te = resolved_type->to<IR::Type_Extern>()) {
        // TODO: Clean this mess up.
        const auto *ext_const = te->lookupConstructor(di->arguments);
        const IR::ParameterList *params = nullptr;
        params = ext_const->getParameters();
        state->declare_var(instance_name, new ExternInstance(state, te), te);
    } else if (const auto *instance_decl =
                   resolved_type->to<IR::Type_Declaration>()) {
        const IR::ParameterList *params = nullptr;
        const IR::TypeParameters *type_params = nullptr;
        if (const auto *c = instance_decl->to<IR::P4Control>()) {
            params = c->getConstructorParameters();
            type_params = c->getTypeParameters();
        } else if (const auto *p = instance_decl->to<IR::P4Parser>()) {
            params = p->getConstructorParameters();
            type_params = p->getTypeParameters();
        } else {
            P4C_UNIMPLEMENTED("Type Declaration %s of type %s not supported.",
                              resolved_type, resolved_type->node_type_name());
        }
        auto var_map = state->merge_args_with_params(
            &resolve_expr, *di->arguments, *params, *type_params);
        state->declare_var(
            di->name.name,
            new ControlInstance(state, instance_decl, var_map.second),
            resolved_type);
    } else {
        P4C_UNIMPLEMENTED("Resolved type %s of type %s not supported, ",
                          resolved_type, resolved_type->node_type_name());
    }
    return false;
}

bool TypeVisitor::preorder(const IR::Declaration_Constant *dc) {
    P4Z3Instance *left = nullptr;
    const auto *type_clone =
        dc->type->apply(DoBitFolding(state))->checkedTo<IR::Type>();
    const auto *resolved_type = state->resolve_type(type_clone);
    if (dc->initializer != nullptr) {
        auto resolve_expr = Z3Visitor(state, false);
        dc->initializer->apply(resolve_expr);
        left = state->get_expr_result()->cast_allocate(resolved_type);
    } else {
        left = state->gen_instance(UNDEF_LABEL, resolved_type);
    }
    state->declare_var(dc->name.name, left, resolved_type);
    return false;
}

bool TypeVisitor::preorder(const IR::Declaration_Variable *dv) {
    P4Z3Instance *left = nullptr;
    const auto *resolved_type = state->resolve_type(dv->type);
    if (dv->initializer != nullptr) {
        auto resolve_expr = Z3Visitor(state, false);
        dv->initializer->apply(resolve_expr);
        left = state->get_expr_result()->cast_allocate(resolved_type);
    } else {
        left = state->gen_instance(UNDEF_LABEL, resolved_type);
    }
    state->declare_var(dv->name.name, left, resolved_type);

    return false;
}

bool TypeVisitor::preorder(const IR::P4ValueSet *pvs) {
    const auto *resolved_type = state->resolve_type(pvs->elementType);
    auto pvs_name = infer_name(pvs->getAnnotations(), pvs->name.name);
    auto *instance = state->gen_instance(pvs_name, resolved_type);
    state->declare_var(pvs->name.name, instance, resolved_type);
    return false;
}

bool TypeVisitor::preorder(const IR::Declaration_MatchKind * /*dm */) {
    // TODO: Figure out purpose of Declaration_MatchKind
    // state->add_decl(dm->name.name, dm);
    return false;
}

bool TypeVisitor::preorder(const IR::IndexedVector<IR::Declaration> *decls) {
    for (const auto *local_decl : *decls) {
        visit(local_decl);
    }
    return false;
}

void DoBitFolding::postorder(IR::Type_Bits *tb) {
    if (tb->expression != nullptr) {
        tb->expression->apply(Z3Visitor(state, false));
        const auto *result = state->get_expr_result<NumericVal>();
        auto int_size = result->get_val()->simplify().get_numeral_uint64();
        tb->size = int_size;
        tb->expression = nullptr;
    }
}

void DoBitFolding::postorder(IR::Type_Varbits *tb) {
    if (tb->expression != nullptr) {
        tb->expression->apply(Z3Visitor(state, false));
        const auto *result = state->get_expr_result<NumericVal>();
        auto int_size = result->get_val()->simplify().get_numeral_uint64();
        tb->size = int_size;
        tb->expression = nullptr;
    }
}

}  // namespace TOZ3
