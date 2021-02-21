#include <cstdio>
#include <fstream>

#include "frontends/common/applyOptionsPragmas.h"
#include "frontends/common/constantFolding.h"
#include "frontends/common/parseInput.h"
#include "frontends/common/resolveReferences/resolveReferences.h"
#include "frontends/p4/createBuiltins.h"
#include "frontends/p4/directCalls.h"
#include "frontends/p4/evaluator/evaluator.h"
#include "frontends/p4/frontend.h"
#include "frontends/p4/parseAnnotations.h"
#include "frontends/p4/specialize.h"
#include "frontends/p4/specializeGenericFunctions.h"
#include "frontends/p4/typeChecking/bindVariables.h"
#include "frontends/p4/typeMap.h"
#include "frontends/p4/validateParsedProgram.h"

#include "frontends/p4/fromv1.0/v1model.h"
#include "frontends/p4/toP4/toP4.h"

#include "ir/ir-generated.h"
#include "ir/ir.h"
#include "lib/error.h"
#include "lib/exceptions.h"
#include "lib/gc.h"
#include "lib/log.h"
#include "lib/nullstream.h"

#include "toz3_v2/common/state.h"
#include "options.h"
#include "toz3_v2/common/type_map.h"
#include "toz3_v2/common/z3_interpreter.h"

const IR::Declaration_Instance *get_main_decl(TOZ3_V2::P4State *state) {
    const IR::Declaration *main = state->get_decl("main");
    if (auto main_pkg = main->to<IR::Declaration_Instance>()) {
        return main_pkg;
    } else {
        BUG("Main node %s not implemented!", main->node_type_name());
    }
}

int main(int argc, char *const argv[]) {
    setup_gc_logging();

    AutoCompileContext autoP4toZ3Context(new TOZ3_V2::P4toZ3Context);
    auto &options = TOZ3_V2::P4toZ3Context::get().options();
    // we only handle P4_16 right now
    options.langVersion = CompilerOptions::FrontendVersion::P4_16;
    options.compilerVersion = "p4toz3 test";

    if (options.process(argc, argv) != nullptr) {
        options.setInputFile();
    }
    if (::errorCount() > 0)
        return 1;

    auto hook = options.getDebugHook();

    const IR::P4Program *program = nullptr;

    program = P4::parseP4File(options);

    if (program != nullptr && ::errorCount() == 0) {
        z3::context ctx;
        try {
            P4::P4COptionPragmaParser optionsPragmaParser;
            program->apply(P4::ApplyOptionsPragmas(optionsPragmaParser));
            // convert the P4 program to Z3 Python
            TOZ3_V2::P4State state = TOZ3_V2::P4State(&ctx);
            TOZ3_V2::TypeVisitor map_builder = TOZ3_V2::TypeVisitor(&state);
            TOZ3_V2::Z3Visitor to_z3 = TOZ3_V2::Z3Visitor(&state);
            program->apply(map_builder);
            auto decl = get_main_decl(&state);
            decl->apply(to_z3);
            auto decl_result = to_z3.get_decl_result();
            for (auto pipe_state : decl_result) {
                cstring pipe_name = pipe_state.first;
                auto pipe_vars = TOZ3_V2::check_complex<TOZ3_V2::ControlState>(
                    pipe_state.second);
                if (pipe_vars) {
                    printf("Pipe %s state:\n", pipe_name);
                    for (auto tuple : pipe_vars->state_vars) {
                        auto name = tuple.first;
                        auto var = tuple.second;
                        std::cout << name << ": " << var << "\n";
                    }
                } else {
                    warning("No results for pipe %s", pipe_name);
                }
            }
        } catch (const Util::P4CExceptionBase &bug) {
            std::cerr << bug.what() << std::endl;
            return 1;
        }
    }

    return ::errorCount() > 0;
}
