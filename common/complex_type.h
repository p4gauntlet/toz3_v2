#ifndef _TOZ3_COMPLEX_TYPE_H_
#define _TOZ3_COMPLEX_TYPE_H_

#include <cstdio>
#include <z3++.h>

#include <map>    // std::map
#include <string> // std::to_string
#include <vector> // std::vector

#include "ir/ir.h"
#include "lib/cstring.h"

#include "base_type.h"

namespace TOZ3_V2 {

// Forward declare state
class P4State;

class ControlState : public P4ComplexInstance {
 public:
    std::vector<std::pair<cstring, z3::expr>> state_vars;
    ControlState(std::vector<std::pair<cstring, z3::expr>> state_vars)
        : state_vars(state_vars){};
};

class P4Declaration : public P4ComplexInstance {
    // A wrapper class for declarations
 public:
    const IR::Declaration *decl;
    // constructor
    P4Declaration(const IR::Declaration *decl) : decl(decl) {}
};

class Z3Int : public P4ComplexInstance {
 public:
    z3::expr val;
    int64_t width;
    Z3Int(z3::expr val, int64_t width) : val(val), width(width){};
};

class StructBase : public P4ComplexInstance {
 protected:
    P4State *state;
    std::map<cstring, P4Z3Instance> members;
    std::map<cstring, const IR::Type *> member_types;

 public:
    const IR::Type_StructLike *p4_type;
    uint64_t member_id;
    uint64_t width;
    StructBase(P4State *state, const IR::Type_StructLike *type,
               uint64_t member_id);
    virtual std::vector<std::pair<cstring, z3::expr>>
    get_z3_vars(cstring prefix = "");

    P4Z3Instance get_member(cstring name) { return members.at(name); }

    void update_member(cstring name, P4Z3Instance val) {
        members.at(name) = val;
    }
    void insert_member(cstring name, P4Z3Instance val) {
        members.insert({name, val});
    }
    std::map<cstring, P4Z3Instance> *get_member_map() { return &members; }
    const std::map<cstring, P4Z3Instance> *get_immutable_member_map() const {
        return &members;
    }

    ~StructBase() {}
    // copy constructor
    StructBase(const StructBase &other);
    // overload = operator
    StructBase &operator=(const StructBase &other);
};

class StructInstance : public StructBase {
    using StructBase::StructBase;
};

class HeaderInstance : public StructBase {
    using StructBase::StructBase;

 private:
    z3::expr valid;

 public:
    HeaderInstance(P4State *state, const IR::Type_StructLike *type,
                   uint64_t member_id);
    void set_valid();

    void set_invalid();

    z3::expr is_valid();
    std::vector<std::pair<cstring, z3::expr>>
    get_z3_vars(cstring prefix = "") override;
};

class EnumInstance : public P4ComplexInstance {
 private:
    P4State *state;
    std::map<cstring, P4Z3Instance> members;

 public:
    const IR::Type_Enum *p4_type;
    uint64_t width;
    uint64_t member_id;
    EnumInstance(P4State *state, const IR::Type_Enum *type, uint64_t member_id);
    std::vector<std::pair<cstring, z3::expr>> get_z3_vars(cstring prefix = "");

    P4Z3Instance get_member(cstring name) { return members.at(name); }

    void update_member(cstring name, P4Z3Instance val) {
        members.at(name) = val;
    }
    void insert_member(cstring name, P4Z3Instance val) {
        members.insert({name, val});
    }
    std::map<cstring, P4Z3Instance> *get_member_map() { return &members; }
    const std::map<cstring, P4Z3Instance> *get_immutable_member_map() const {
        return &members;
    }
};

class ErrorInstance : public P4ComplexInstance {
 private:
    P4State *state;
    std::map<cstring, P4Z3Instance> members;

 public:
    const IR::Type_Error *p4_type;
    uint64_t member_id;
    uint64_t width;
    ErrorInstance(P4State *state, const IR::Type_Error *type,
                  uint64_t member_id);
    std::vector<std::pair<cstring, z3::expr>> get_z3_vars(cstring prefix = "");

    P4Z3Instance get_member(cstring name) { return members.at(name); }

    void update_member(cstring name, P4Z3Instance val) {
        members.at(name) = val;
    }
    void insert_member(cstring name, P4Z3Instance val) {
        members.insert({name, val});
    }
    std::map<cstring, P4Z3Instance> *get_member_map() { return &members; }
    const std::map<cstring, P4Z3Instance> *get_immutable_member_map() const {
        return &members;
    }
}; // namespace TOZ3_V2

class ExternInstance : public P4ComplexInstance {
 private:
 public:
    const IR::Type_Extern *p4_type;
    uint64_t width;
    ExternInstance(P4State *state, const IR::Type_Extern *type);
};

} // namespace TOZ3_V2

#endif // _TOZ3_COMPLEX_TYPE_H_
