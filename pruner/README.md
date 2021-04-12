# The Gauntlet Pruner

The Gauntlet pruner is a tool designed to reduce the size of P4 programs that cause crashes or abnormal behavior in P4 compilers. This tool is intended to be used in combination with the [Gauntlet tool suite](https://github.com/p4gauntlet/gauntlet/). The pruner currently supports the pruning of programs with crash  (exit code 1) or semantic translation bugs (exit code 20, as defined [here](https://github.com/p4gauntlet/gauntlet/blob/master/src/p4z3/util.py#L10)).

## Usage
Note: A sample configuration file is provided [here](https://github.com/p4gauntlet/pruner/blob/documentation/program_with_validation_bug.json).

### Configuration file Format
The pruner can automatically load some basic configuration parameters from a
JSON configuration file. The file has the following fields:

```bash
 # Was the validation bug found when undefined behavior was allowed?
"allow_undef": false,
 # What was the compiler used to compile the P4 program?
"compiler": "gauntlet/modules/p4c/build/p4test",
 # The exit code of the program
"exit_code": 1,
 # the input P4 program
"input_file": "program_with_validation_bug.p4",
 # the target directory of the binary that compiled the program
"out_dir": "gauntlet/random/validation_bugs",
# the binary to the P4-to-Z3 interpreter
"p4z3_bin": "",
# if we encountered a validation bug, this describes the incorrect program
"prog_after": "",
# the program that was still correct, before a miscompilation occurred
"prog_before": "",
# the path to the validation tool that found the bug
"validation_bin": "",
# the error message that was recorded when the binary exited
"err_string": ""
```

### Pruning with a Configuration File
If a configuration file is provided only the P4 program is necessary:

`p4pruner --config [P4_CONFIG] [P4_PROG]`

### Pruning without a Configuration File
If no configuration file is present, the pruner requires the path to the validation binary that was used, as well as the compiler that was used to translate the P4 program:

`p4pruner --compiler-bin [PATH_TO_COMPILER_BIN] --validation-bin [PATH_TO_VALIDATION_BIN] [P4_PROG] --bug-type [VALIDATION/CRASH]`

For crash bugs, the validation binary can be omitted:

`p4pruner --compiler-bin [PATH_TO_COMPILER_BIN] [P4_PROG] --bug-type [VALIDATION/CRASH]`


## The Pruning Stages
The pruning passes build on top of each other. The current order of execution is as follows:

```
Statement pruning // randomly remove statements
        V
Expression pruning // randomly remove expressions
        V
Boolean expression pruning // simplify boolean expressions
        V
Generic passes // reuse initialization passes from P4C
        V
Replace variables // replace variables with constants
        V
Extended remove unused declarations // remove any unused declarations
```

The following passes to prune a P4 program are currently implemented:

### Statement Pruning

#### Required Preceding Passes

- None

#### Parameters
- `SIZE_BANK_RATIO`  : The ratio between the initial size of the bank of statements and the size of the program.
- `PRUNE_ITERS`     : The number of times the statement pruner would run through the program.
- `NO_CHNG_ITERS`   : If the program remains the same for this number of iterations then we assume the phase is completed and move to the next pass.
- `AIDM_INCREASE`   : The additive increasing factor for the bank of statements.
- `AIDM_DECREASE`   : The multiplicative decreasing factor for the bank of statements.

#### Description

This pass tries to prune statements from the program. A certain number of statements are chosen at random by a `Collector` which is a subclass of an `Inspector`. Then these are fed to a `Pruner` which is a subclass of a `Transform`, which actually prunes the statements from the program tree. We start with a very large number of statements to prune, and then follow an additive increase/multiplicative decrease (AIMD) scheme. If we were successful in our attempt, i.e. the exit code of the program remained the same and the bug still exists in the program, we increase the bank by 2 statements otherwise we half the size of the bank.


### Expression Pruning

#### Required Preceding Passes

- None

#### Parameters
- `PRUNE_ITERS`     : The number of times the expressions pruner would run through the program.
- `NO_CHNG_ITERS`   : If the program remains the same for this number of iterations then we assume the phase is completed and move to the next pass.

#### Description

This pass operators similarly as the statement pruner but prunes the expressions in the statements that remain. We explicitly define how the pass would handle and prune different types of expressions. For example, given an addition operator, we try to randomly pick a side and see if the bug remains. In other cases, for example shifts, we just pick the value that is to be shifted. Only few expressions are implemented so far, for example  `Range` or a `Slice` are still missing.


### Boolean Pruning

#### Required Preceding Passes

- None

#### Parameters
- `PRUNE_ITERS`     : The number of times the boolean pruner would run through the program.
- `NO_CHNG_ITERS`   : If the program remains the same for this number of iterations then we assume the phase is completed and move to the next pass.

#### Description

This pass now tries to prune and simplify boolean expressions. Given a boolean expression we try to replace it with a random boolean literal and see if the bug remains.

### Compiler Pruning

The passes after this stage require some generic passes from P4C. We execute these passes
to retrieve the reference map and infer all types in the program. Note, that because
type inference requires constant folding, we may not always be able to apply these passes.

```
ResolveReferences,
ConstantFolding,
InstantiateDirectCalls,
TypeInference
```

### Replace Variables

#### Required Preceding Passes

- Generic Passes once
- `ResolveReferences and TypeInference` every pass

#### Parameters
- None

#### Description

This pass tries to replace each variable with a literal and checks if the bug remained. For example, it might turn the expressions `aVar + bVar` to `16w0 + 10w0` depending upon the bit width of the variables. We do this to aid the subsequent pass (i.e Extended unused declarations) which tries to remove all unused declarations from the program. This pass frees up more expressions and declarations, that can then be removed by the next pass.

### Extended Remove Unused Declarations

#### Required Preceding Passes

- Generic Passes once
- Replace variables

#### Parameters
- None

#### Description

This is a subclass of `P4::RemoveUnusedDeclarations` where we try to aggressively remove all unused declarations as opposed to the conservative approach of P4C. We do not care about maintaining the functionality of the program only about the bug that exists in it.

===== 
## Testing

To reproduce pruning of old bugs, we maintain a folder of binaries with bugs in the `tests` folder.

We use `check_prog.p4` for testing. The program takes a P4 file along with a P4C binary ( and optionally a validation binary) as input, prunes the provided program with a fixed seed, and then compares the output to a reference file. If the output and reference file match, the test passes.

Note that the provided P4 program must have a reference present in the `references` directory.

### Usage

`check_prog.py  --pruner_path [PATH_TO_PRUNER_BIN] --compiler [PATH_TO_COMPILER_BIN] --validation [PATH_TO_VALIDATION_BIN] --p4prog [P4_PROG] --type [V/C]`

Also, there is a folder called `p4c_bins` which will house various versions of the P4C compiler each named after the commit hash of the time it was compiled.
