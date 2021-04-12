#ifndef _P4PRUNER_OPTIONS_H_
#define _P4PRUNER_OPTIONS_H_

#include "ir/ir.h"

#include "frontends/common/options.h"
#include "lib/options.h"

namespace P4PRUNER {

class PrunerOptions : public CompilerOptions {
 public:
    PrunerOptions();
    // output file
    cstring config_file = nullptr;
    cstring validation_bin = nullptr;
    cstring compiler_bin = nullptr;
    cstring working_dir = "pruned/";
    bool dry_run = false;
    bool do_rnd_prune = false;
    bool print_pruned = false;
    cstring seed;
    cstring bug_type;
    cstring output_file = nullptr;
};

using P4PrunerContext = P4CContextWithOptions<PrunerOptions>;

} // namespace P4PRUNER

#endif /* _P4PRUNER_OPTIONS_H_ */
