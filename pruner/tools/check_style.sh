#!/bin/bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

ROOT_DIR=$THIS_DIR/..

return_status=0

function run_cpplint() {
    # $1 is directory
    # $2 is root
    python2 $THIS_DIR/cpplint.py --root=$2 $( find $1 -name \*.h -or -name \*.cpp )
    return_status=$(($return_status || $?))
}

run_cpplint $ROOT_DIR/src

echo "********************************"
if [ $return_status -eq 0 ]; then
    echo "STYLE CHECK SUCCESS"
else
    echo "STYLE CHECK FAILURE"
fi

exit $return_status
