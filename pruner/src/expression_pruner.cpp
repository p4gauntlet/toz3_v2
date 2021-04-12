#include "expression_pruner.h"

namespace P4PRUNER {

const IR::Node *pick_side_binary(IR::Operation_Binary *s) {
    auto decision = get_rnd_pct();
    if (decision < 0.33) {
        // return the left-hand side of the expression
        return s->left;
    } else if (decision < 0.66) {
        // return the right-hand side of the expression
        return s->right;
    }
    // do nothing, just return the node
    return s;
}

const IR::Node *pick_side_unary(IR::Operation_Unary *s) {
    auto decision = get_rnd_pct();
    if (decision < 0.5) {
        // return the expression inside the operation
        return s->expr;
    }
    return s;
}

const IR::Node *pick_side_shift_left(IR::Operation_Binary *s) {
    auto decision = get_rnd_pct();
    if (decision < 0.5) {
        // return the left side of the shift
        return s->left;
    } else {
        // return the unchanged operation
        return s;
    }
}

const IR::Node *ExpressionPruner::postorder(IR::Add *s) {
    return pick_side_binary(s);
}
const IR::Node *ExpressionPruner::postorder(IR::AddSat *s) {
    return pick_side_binary(s);
}

const IR::Node *ExpressionPruner::postorder(IR::Sub *s) {
    return pick_side_binary(s);
}

const IR::Node *ExpressionPruner::postorder(IR::SubSat *s) {
    return pick_side_binary(s);
}

const IR::Node *ExpressionPruner::postorder(IR::Mul *s) {
    return pick_side_binary(s);
}

const IR::Node *ExpressionPruner::postorder(IR::Div *s) {
    return pick_side_binary(s);
}

const IR::Node *ExpressionPruner::postorder(IR::BAnd *s) {
    return pick_side_binary(s);
}

const IR::Node *ExpressionPruner::postorder(IR::BOr *s) {
    return pick_side_binary(s);
}
const IR::Node *ExpressionPruner::postorder(IR::BXor *s) {
    return pick_side_binary(s);
}

// Unary operations

const IR::Node *ExpressionPruner::postorder(IR::Neg *s) {
    return pick_side_unary(s);
}

const IR::Node *ExpressionPruner::postorder(IR::Cmpl *s) {
    return pick_side_unary(s);
}

// Shifts

const IR::Node *ExpressionPruner::postorder(IR::Mod *s) {
    return pick_side_shift_left(s);
}

const IR::Node *ExpressionPruner::postorder(IR::Shl *s) {
    return pick_side_shift_left(s);
}

const IR::Node *ExpressionPruner::postorder(IR::Shr *s) {
    return pick_side_shift_left(s);
}

const IR::P4Program *remove_expressions(const IR::P4Program *temp) {
    // Removes all the nodes it recieves from the vector
    P4PRUNER::ExpressionPruner *expression_pruner =
        new P4PRUNER::ExpressionPruner();
    temp = temp->apply(*expression_pruner);
    return temp;
}

const IR::P4Program *prune_expressions(const IR::P4Program *program,
                                       P4PRUNER::PrunerConfig pruner_conf) {
    int same_before_pruning = 0;
    int result;
    INFO("\nPruning expressions");
    for (int i = 0; i < PRUNE_ITERS; i++) {
        auto temp = program;
        temp = remove_expressions(program);
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
