#include "extended_unused.h"

#include "frontends/p4/sideEffects.h"

namespace P4PRUNER {

const IR::Node *PruneUnused::preorder(IR::Type_StructLike *ts) {
    prune(); // do not remove individual struct members yet
    if (!unused_refMap->isUsed(getOriginal<IR::IDeclaration>())) {
        return nullptr;
    }
    return ts;
}

const IR::Node *PruneUnused::preorder(IR::Type_Extern *te) {
    if (!unused_refMap->isUsed(getOriginal<IR::IDeclaration>())) {
        return nullptr;
    }
    return te;
}

const IR::Node *PruneUnused::preorder(IR::Method *m) {
    if (!unused_refMap->isUsed(getOriginal<IR::IDeclaration>())) {
        return nullptr;
    }
    return m;
}

const IR::Node *PruneUnused::preorder(IR::Function *f) {
    if (!unused_refMap->isUsed(getOriginal<IR::IDeclaration>())) {
        return nullptr;
    }
    return f;
}

} // namespace P4PRUNER
