#!/bin/bash

# exit when any command fails
set -e

SRC_DIR="$(pwd)"

# fetch submodules and update apt
echo "Pulling in gauntlet"
git clone https://github.com/p4gauntlet/gauntlet
rm -rf gauntlet/modules/pruner
ln -s ${SRC_DIR} gauntlet/modules/pruner
cd gauntlet 
./do_install.sh
cd ${SRC_DIR}
