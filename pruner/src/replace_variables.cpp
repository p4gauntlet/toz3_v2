#include "vector"

#include "replace_variables.h"

#include "frontends/common/constantFolding.h"
#include "frontends/common/resolveReferences/resolveReferences.h"
#include "frontends/p4/createBuiltins.h"
#include "frontends/p4/directCalls.h"
#include "frontends/p4/simplify.h"
#include "frontends/p4/simplifyDefUse.h"
#include "frontends/p4/unusedDeclarations.h"

namespace P4PRUNER {

const IR::Node *ReplaceVariables::postorder(IR::MethodCallExpression *s) {
    return s;
}
const IR::Node *ReplaceVariables::postorder(IR::Expression *s) {
    auto expr = getOriginal<IR::Expression>();
    auto type = typeMap->getType(expr, true);

    if (typeMap->isLeftValue(expr)) {
        return s;
    }
    int bits = type->width_bits();

    auto decision = get_rnd_pct();
    if (decision < 0.5 && type->is<IR::Type_Bits>()) {
        auto new_elt = new IR::Constant(new IR::Type_Bits(bits, false), 10);
        return new_elt;
    }
    return s;
}

const IR::P4Program *apply_replace(const IR::P4Program *program,
                                   P4PRUNER::PrunerConfig pruner_conf) {
    P4::ReferenceMap refMap;
    P4::TypeMap typeMap;
    const IR::P4Program *temp;

    PassManager pass_manager({new P4::ResolveReferences(&refMap, true),
                              new P4::TypeInference(&refMap, &typeMap, false)});

    temp = program->apply(pass_manager);

    P4PRUNER::ReplaceVariables *replacer =
        new P4PRUNER::ReplaceVariables(&refMap, &typeMap);
    temp = temp->apply(*replacer);

    return temp;
}
const IR::P4Program *replace_variables(const IR::P4Program *program,
                                       P4PRUNER::PrunerConfig pruner_conf) {
    int same_before_pruning = 0;
    int result;
    auto prev_action = P4CContext::get().getDefaultWarningDiagnosticAction();
    auto action = DiagnosticAction::Ignore;
    P4CContext::get().setDefaultWarningDiagnosticAction(action);

    INFO("Replacing variables with literals");
    for (int i = 0; i < 5; i++) {
        auto temp = program;

        temp = apply_replace(temp, pruner_conf);

        result = check_pruned_program(&program, temp, pruner_conf);

        if (result != EXIT_SUCCESS) {
            same_before_pruning++;
        } else {
            // successful run, reset short-circuit
            program = temp;
            same_before_pruning = 0;
        }
        if (same_before_pruning >= NO_CHNG_ITERS) {
            break;
        }
    }
    // reset to previous warning
    P4CContext::get().setDefaultWarningDiagnosticAction(prev_action);
    // Done pruning
    return program;
}

} // namespace P4PRUNER
