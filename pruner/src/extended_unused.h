#ifndef _PRUNE_UNUSED_H_
#define _PRUNE_UNUSED_H_

#include "frontends/common/resolveReferences/resolveReferences.h"
#include "frontends/p4/unusedDeclarations.h"
#include "ir/ir.h"

namespace P4PRUNER {

class PruneUnused : public P4::RemoveUnusedDeclarations {
    // the refmap of the parent class is private so we have to use our own
    // a little bit unfortunate but the pointer is the same
    // we also do not modify the map so this is fairly safe
    const P4::ReferenceMap *unused_refMap;

 public:
    explicit PruneUnused(const P4::ReferenceMap *refMap)
        : P4::RemoveUnusedDeclarations(refMap), unused_refMap(refMap) {
        CHECK_NULL(refMap);
        setName("PruneUnused");
    }
    const IR::Node *preorder(IR::Type_StructLike *type) override;
    const IR::Node *preorder(IR::Type_Extern *type) override;
    const IR::Node *preorder(IR::Method *type) override;
    const IR::Node *preorder(IR::Function *type) override;
};

class ExtendedUnusedDeclarations : public PassManager {
 public:
    explicit ExtendedUnusedDeclarations(P4::ReferenceMap *refMap) {
        CHECK_NULL(refMap);
        passes.emplace_back(new PassRepeated{new P4::ResolveReferences(refMap),
                                             new PruneUnused(refMap)});
        setName("ExtendedUnusedDeclarations");
    }
};

} // namespace P4PRUNER

#endif /* _PRUNE_UNUSED_H_ */
