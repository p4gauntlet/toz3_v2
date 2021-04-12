
#ifndef _EXPRESSION_PRUNER_H
#define _EXPRESSION_PRUNER_H
#include <vector>

#include "ir/ir.h"
#include "pruner_util.h"

namespace P4PRUNER {

class ExpressionPruner : public Transform {
 public:
    ExpressionPruner() {
        visitDagOnce = true;
        setName("Pruner");
    }

    const IR::Node *postorder(IR::Neg *expr);
    const IR::Node *postorder(IR::Cmpl *expr);
    const IR::Node *postorder(IR::Mul *expr);
    const IR::Node *postorder(IR::Div *expr);
    const IR::Node *postorder(IR::Add *expr);
    const IR::Node *postorder(IR::AddSat *expr);
    const IR::Node *postorder(IR::Sub *expr);
    const IR::Node *postorder(IR::SubSat *expr);
    const IR::Node *postorder(IR::BAnd *expr);
    const IR::Node *postorder(IR::BOr *expr);
    const IR::Node *postorder(IR::BXor *expr);

    /* these are shifts, we should only use the left-hand value */
    const IR::Node *postorder(IR::Mod *expr);
    const IR::Node *postorder(IR::Shl *expr);
    const IR::Node *postorder(IR::Shr *expr);

    // To be Implemented -----------

    // const IR::Node *postorder(const IR::Mask *m);
    // const IR::Node *postorder(const IR::Range *r);
    // const IR::Node *postorder(const IR::Cast *c);
    // const IR::Node *postorder(const IR::Concat *c);
    // const IR::Node *postorder(const IR::Slice *s);
    // const IR::Node *postorder(const IR::Mux *m);
    // const IR::Node *postorder(const IR::Member *m);
    // const IR::Node *postorder(const IR::PathExpression *p);
    // const IR::Node *postorder(const IR::SerEnumMember *m);
    // const IR::Node *postorder(const IR::DefaultExpression *de);
    // const IR::Node *postorder(const IR::ListExpression *le);
    // const IR::Node *postorder(const IR::TypeNameExpression *tn);
    // const IR::Node *postorder(const IR::NamedExpression *ne);
    // const IR::Node *postorder(const IR::StructExpression *sie);
    // const IR::Node *postorder(const IR::ConstructorCallExpression *cc);
    // const IR::Node *postorder(const IR::MethodCallExpression *mce);
    // const IR::Node *postorder(const IR::StructExpression *s);
};

const IR::P4Program *prune_expressions(const IR::P4Program *program,
                                       P4PRUNER::PrunerConfig pruner_conf);

} // namespace P4PRUNER

#endif /* _EXPRESSION_PRUNER_H */
