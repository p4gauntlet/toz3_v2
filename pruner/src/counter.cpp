#include "counter.h"
namespace P4PRUNER {
Visitor::profile_t Counter::init_apply(const IR::Node *node) {
    return Inspector::init_apply(node);
}

bool Counter::preorder(const IR::Statement *) {
    statements++;
    return true;
}
} // namespace P4PRUNER
