#ifndef _PRUNER_SRC_COUNTER_H
#define _PRUNER_SRC_COUNTER_H

#include "ir/ir.h"

namespace P4PRUNER {
class Counter : public Inspector {
 public:
    Visitor::profile_t init_apply(const IR::Node *node) override;
    bool preorder(const IR::Statement *s) override;
    uint64_t statements;

    Counter() { statements = 0; }
};
} // namespace P4PRUNER
#endif /* _PRUNER_SRC_COUNTER_H */
