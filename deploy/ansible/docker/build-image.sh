#!/bin/bash

EXECDIR=$( cd "$( dirname "$0" )" && pwd -P )

docker build --no-cache \
    -t ansible:py3.10 \
    -f $EXECDIR/Dockerfile \
    $EXECDIR/
