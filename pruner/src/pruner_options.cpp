#include "pruner_options.h"
#include <cctype>
namespace P4PRUNER {

PrunerOptions::PrunerOptions() {
    registerOption(
        "--dry-run", nullptr,
        [this](const char *) {
            dry_run = true;
            return true;
        },
        "Whether to emit a p4 file after.");
    registerOption(
        "--config", "file",
        [this](const char *arg) {
            config_file = arg;
            return true;
        },
        "A configuration file with hints for validation.");
    registerOption(
        "--validation-bin", "file",
        [this](const char *arg) {
            validation_bin = arg;
            return true;
        },
        "Path to the validation python script");
    registerOption(
        "--compiler-bin", "file",
        [this](const char *arg) {
            compiler_bin = arg;
            return true;
        },
        "Path to the compiler binary that is used");
    registerOption(
        "--working-dir", "file",
        [this](const char *arg) {
            working_dir = arg;
            return true;
        },
        "Where to place ephemeral files.");
    registerOption(
        "--print-pruned", nullptr,
        [this](const char *) {
            print_pruned = true;
            return true;
        },
        "Whether to print out the pruned file to stdout");
    registerOption(
        "--seed", "seed",
        [this](const char *arg) {
            seed = arg;
            return true;
        },
        "The seed for the random program. "
        "If no seed is provided we generate our own.");
    registerOption(
        "--output", "file",
        [this](const char *arg) {
            output_file = arg;
            return true;
        },
        "The name of the output file.");

    registerOption(
        "--bug-type", "type",
        [this](const char *arg) {
            bug_type = arg;
            return true;
        },
        "The type of bug, enter VALIDATION for validation bug, CRASH for crash "
        "bug");
}

} // namespace P4PRUNER
