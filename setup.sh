#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

. ./mac/brew/install_brew.sh

. ./install
