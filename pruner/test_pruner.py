#!/usr/bin/env python3
import logging
from pathlib import Path
import pytest
import subprocess


EXIT_SUCCESS = 0
EXIT_FAILURE = 1

# configure logging
log = logging.getLogger(__name__)
logging.basicConfig(filename="test_pruner.log",
                    format="%(levelname)s:%(message)s",
                    level=logging.INFO,
                    filemode='w')
stderr_log = logging.StreamHandler()
stderr_log.setFormatter(logging.Formatter("%(levelname)s:%(message)s"))
logging.getLogger().addHandler(stderr_log)

# some folder definitions
FILE_DIR = Path.resolve(Path(__file__)).parent
TEST_DIR = FILE_DIR.joinpath("tests")
REFERENCE_DIR = TEST_DIR.joinpath("references")

CRASH_DIR = REFERENCE_DIR.joinpath("crash_bugs")
VALIDATION_DIR = REFERENCE_DIR.joinpath("validation")

# We'll update this with every p4c commit

P4C_BIN = TEST_DIR.joinpath(
    "broken_p4c/24895c1b28a35352f1d9ad1f43878c4f7061d3ab")

VALIDATION_BIN = FILE_DIR.parent.parent.joinpath(
    "bin").joinpath("validate_p4_translation")

CHECK_PROG_BIN = TEST_DIR.joinpath("check_prog.py")

PRUNER_BIN = FILE_DIR.parent.joinpath('p4c').joinpath('build').joinpath(
    'extensions').joinpath('pruner').joinpath('p4pruner')


def exec_process(cmd, *args, silent=False, **kwargs):
    log.debug("Executing %s ", cmd)
    result = subprocess.run(cmd.split(),
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            *args,
                            **kwargs)
    if result.stdout:
        log.debug("Process output: %s", result.stdout.decode("utf-8"))
    if result.returncode != EXIT_SUCCESS and not silent:
        log.error("BEGIN %s", 40 * "#")
        log.error("Failed while executing:\n%s\n", cmd)
        log.error("Output:\n%s", result.stderr.decode("utf-8"))
        log.error("END %s", 40 * "#")

    return result


@pytest.mark.run_default
def test_crash_bugs():
    for file in CRASH_DIR.glob('*.p4'):
        basename = file.name
        if "reference" in basename:
            continue
        cmd_args = f"python3 {CHECK_PROG_BIN} --pruner_path {PRUNER_BIN} --compiler {P4C_BIN} --validation {VALIDATION_BIN} --p4prog {file} -ll DEBUG --type CRASH"
        assert exec_process(cmd_args).returncode == 0


@pytest.mark.run_default
def test_validation_bugs():
    for file in VALIDATION_DIR.glob('*.p4'):
        basename = file.name
        if "reference" in basename:
            continue
        cmd_args = f"python3 {CHECK_PROG_BIN} --pruner_path {PRUNER_BIN} --compiler {P4C_BIN} --validation {VALIDATION_BIN} --p4prog {file} -ll DEBUG --type CRASH"
        assert exec_process(cmd_args).returncode == 0
