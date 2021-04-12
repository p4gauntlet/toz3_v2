
#ifndef _BOOLEAN_PASS_H
#define _BOOLEAN_PASS_H
#include <vector>

#include "ir/ir.h"
#include "pruner_util.h"

namespace P4PRUNER {

class BoolExpressionPruner : public Transform {
 public:
    BoolExpressionPruner() { visitDagOnce = true; }

    const IR::Node *postorder(IR::LAnd *);
    const IR::Node *postorder(IR::Neq *);
    const IR::Node *postorder(IR::Lss *);
    const IR::Node *postorder(IR::Leq *);
    const IR::Node *postorder(IR::Grt *);
    const IR::Node *postorder(IR::Geq *);
    const IR::Node *postorder(IR::LOr *);
    const IR::Node *postorder(IR::Equ *);
};

const IR::P4Program *prune_bool_expressions(const IR::P4Program *program,
                                            P4PRUNER::PrunerConfig pruner_conf);

} // namespace P4PRUNER

#endif /* _BOOLEAN_PASS_H */
