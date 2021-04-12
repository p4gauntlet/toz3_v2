#ifndef _REPLACE_VARIABLES_H
#define _REPLACE_VARIABLES_H
// #include <vector>

#include "ir/ir.h"
#include "pruner_util.h"

#include "frontends/common/resolveReferences/resolveReferences.h"
#include "frontends/p4/typeMap.h"

namespace P4PRUNER {

class ReplaceVariables : public Transform {
    P4::ReferenceMap *refMap;
    P4::TypeMap *typeMap;

 public:
    ReplaceVariables(P4::ReferenceMap *refMap, P4::TypeMap *typeMap)
        : refMap(refMap), typeMap(typeMap) {
        visitDagOnce = true;
        CHECK_NULL(refMap);
        CHECK_NULL(typeMap);
        setName("ReplaceVariables");
    }

    const IR::Node *postorder(IR::Expression *s);
    const IR::Node *postorder(IR::MethodCallExpression *s);
};

const IR::P4Program *replace_variables(const IR::P4Program *program,
                                       P4PRUNER::PrunerConfig pruner_conf);

} // namespace P4PRUNER

#endif /* _REPLACE_VARIABLES_H */
