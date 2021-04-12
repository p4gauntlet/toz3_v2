#include <algorithm> // std::min

#include "statement_pruner.h"

namespace P4PRUNER {

const IR::Node *Pruner::preorder(IR::Statement *s) {
    for (uint64_t i = 0; i < to_prune.size(); i++) {
        if (*to_prune.at(i) == *s) {
            return nullptr;
        }
    }
    return s;
}

const IR::Node *Pruner::preorder(IR::BlockStatement *s) {
    for (auto c : s->components) {
        visit(c);
    }

    return s;
}

const IR::Node *Pruner::preorder(IR::ReturnStatement *s) {
    // do not prune return statements
    return s;
}

Visitor::profile_t Collector::init_apply(const IR::Node *node) {
    return Inspector::init_apply(node);
}

bool Collector::preorder(const IR::Statement *s) {
    if (to_prune.size() <= max_statements && (get_rnd_pct() < 0.5)) {
        to_prune.push_back(s);
    }

    return true;
}

bool Collector::preorder(const IR::BlockStatement *s) {
    for (auto c : s->components) {
        visit(c);
    }

    return true;
}

const std::vector<const IR::Statement *>
collect_statements(const IR::P4Program *temp, int max) {
    // An inspector that collects some statements at random
    P4PRUNER::Collector *collector = new P4PRUNER::Collector(max);
    temp->apply(*collector);
    return collector->to_prune;
}

const IR::P4Program *
remove_statements(const IR::P4Program *temp,
                  std::vector<const IR::Statement *> to_prune) {
    // Removes all the nodes it recieves from the vector
    P4PRUNER::Pruner *pruner = new P4PRUNER::Pruner(to_prune);
    temp = temp->apply(*pruner);
    return temp;
}

const IR::P4Program *prune_statements(const IR::P4Program *program,
                                      P4PRUNER::PrunerConfig pruner_conf,
                                      uint64_t prog_size) {
    int same_before_pruning = 0;
    int result;
    int max_statements = prog_size / SIZE_BANK_RATIO;

    INFO("\nPruning statements");
    for (int i = 0; i < PRUNE_ITERS; i++) {
        INFO("Trying with  " << max_statements << " statements");
        auto temp = program;
        std::vector<const IR::Statement *> to_prune =
            collect_statements(temp, max_statements);
        temp = remove_statements(temp, to_prune);
        result = check_pruned_program(&program, temp, pruner_conf);
        if (result != EXIT_SUCCESS) {
            same_before_pruning++;
            max_statements = std::max(1, max_statements / AIMD_DECREASE);
        } else {
            // successful run, reset short-circuit
            same_before_pruning = 0;
            max_statements += AIMD_INCREASE;
        }
        if (same_before_pruning >= NO_CHNG_ITERS) {
            break;
        }
    }
    // Done pruning
    return program;
}

} // namespace P4PRUNER
