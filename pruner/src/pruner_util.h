#ifndef _PRUNER_UTIL_H_
#define _PRUNER_UTIL_H_

#include "ir/ir.h"

#include "pruner_options.h"

#define INFO(x) std::cout << x << std::endl;

// define some fixed constants
#define SIZE_BANK_RATIO 1.1
#define PRUNE_ITERS 50
#define NO_CHNG_ITERS 10

// AIDM constants
#define AIMD_INCREASE 2
#define AIMD_DECREASE 2

// adding TEST, as it collides with constants defined by cpp.
#define EXIT_TEST_VALIDATION 20
#define EXIT_TEST_FAILURE -1
#define EXIT_TEST_SUCCESS 0
#define EXIT_TEST_UNDEFINED 30

namespace P4PRUNER {

enum class ErrorType : uint32_t {
    SemanticBug = 0,
    CrashBug = 1,
    Error = 2,
    Unknown = 3,
    Success = 4,
    Undefined = 5
};

struct ExitInfo {
    int exit_code;
    cstring err_msg;
    ExitInfo() : exit_code(0), err_msg(nullptr) {}
};

struct PrunerConfig {
    int exit_code;
    cstring validation_bin;
    cstring prog_before;
    cstring prog_post;
    cstring compiler;
    cstring working_dir;
    cstring out_file_name;
    cstring err_string;
    bool allow_undef;
    ErrorType err_type;
    PrunerConfig()
        : exit_code(0), validation_bin(nullptr), prog_before{nullptr},
          prog_post(nullptr), compiler(nullptr), working_dir(nullptr),
          out_file_name(nullptr), err_string(nullptr), allow_undef(false),
          err_type(ErrorType::Unknown) {}
};

void set_seed(int64_t seed);
int64_t get_rnd_int(int64_t min, int64_t max);
big_int get_rnd_big_int(big_int min, big_int max);
double get_rnd_pct();

bool file_exists(cstring file_path);
void create_dir(cstring folder_path);
void remove_file(cstring file_path);
cstring remove_extension(cstring file_path);
cstring get_file_stem(cstring file_path);
cstring get_parent(cstring file_path);

ExitInfo get_exit_info(cstring name, P4PRUNER::PrunerConfig pruner_conf);
ExitInfo get_crash_exit_info(cstring name, P4PRUNER::PrunerConfig pruner_conf);

ErrorType classify_bug(ExitInfo exit_info);
int get_exit_code(cstring name, P4PRUNER::PrunerConfig pruner_conf);

void emit_p4_program(const IR::P4Program *program, cstring prog_name);
void print_p4_program(const IR::P4Program *program);

bool compare_files(const IR::P4Program *prog_before,
                   const IR::P4Program *prog_after);

double measure_pct(const IR::P4Program *prog_before,
                   const IR::P4Program *prog_after);

double measure_size(const IR::P4Program *prog);

uint64_t count_statements(const IR::P4Program *prog);

int check_pruned_program(const IR::P4Program **orig_program,
                         const IR::P4Program *pruned_program,
                         P4PRUNER::PrunerConfig pruner_conf);
} // namespace P4PRUNER

#endif /* _PRUNER_UTIL_H_ */
