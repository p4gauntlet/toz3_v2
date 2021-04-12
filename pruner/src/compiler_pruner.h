#ifndef _COMPILER_PRUNER_H
#define _COMPILER_PRUNER_H

#include "ir/ir.h"
#include "pruner_util.h"

namespace P4PRUNER {

const IR::P4Program *apply_compiler_passes(const IR::P4Program *program,
                                           P4PRUNER::PrunerConfig pruner_conf);

} // namespace P4PRUNER

#endif /* _COMPILER_PRUNER_H */
