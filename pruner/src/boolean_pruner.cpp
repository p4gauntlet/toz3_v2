#include "boolean_pruner.h"

namespace P4PRUNER {

const IR::Node *rand_bool_literal() {
    auto decision = get_rnd_pct();

    return new IR::BoolLiteral(decision < 0.5);
}

const IR::Node *BoolExpressionPruner::postorder(IR::LAnd *) {
    return rand_bool_literal();
}
const IR::Node *BoolExpressionPruner::postorder(IR::Neq *) {
    return rand_bool_literal();
}
const IR::Node *BoolExpressionPruner::postorder(IR::Lss *) {
    return rand_bool_literal();
}
const IR::Node *BoolExpressionPruner::postorder(IR::Leq *) {
    return rand_bool_literal();
}
const IR::Node *BoolExpressionPruner::postorder(IR::Grt *) {
    return rand_bool_literal();
}
const IR::Node *BoolExpressionPruner::postorder(IR::Geq *) {
    return rand_bool_literal();
}

const IR::Node *BoolExpressionPruner::postorder(IR::LOr *) {
    return rand_bool_literal();
}

const IR::Node *BoolExpressionPruner::postorder(IR::Equ *) {
    return rand_bool_literal();
}

const IR::P4Program *remove_bool_expressions(const IR::P4Program *temp) {
    // Removes all the nodes it recieves from the vector
    P4PRUNER::BoolExpressionPruner *bool_expression_pruner =
        new P4PRUNER::BoolExpressionPruner();
    temp = temp->apply(*bool_expression_pruner);
    return temp;
}

const IR::P4Program *
prune_bool_expressions(const IR::P4Program *program,
                       P4PRUNER::PrunerConfig pruner_conf) {
    int same_before_pruning = 0;
    int result;
    INFO("\nReducing boolean expressions")
    for (int i = 0; i < PRUNE_ITERS; i++) {
        auto temp = program;
        temp = remove_bool_expressions(temp);
        result = check_pruned_program(&program, temp, pruner_conf);
        if (result != EXIT_SUCCESS) {
            same_before_pruning++;
        } else {
            // successful run, reset short-circuit
            same_before_pruning = 0;
        }
        if (same_before_pruning >= NO_CHNG_ITERS) {
            break;
        }
    }
    // Done pruning
    return program;
}

} // namespace P4PRUNER
