#!/bin/bash
# docker run --rm -it -v $(PWD)/deploy/ansible:/app -v ~/Key/:/Key/ --workdir /app ansible:py3.10 ansible all -i hosts -m ping
EXECDIR=$( cd "$( dirname "$0" )" && pwd -P )

docker run --rm -it \
    -v $EXECDIR/:/app \
    -v ~/Key/:/Key/ \
    -v $EXECDIR/.ssh:/root/.ssh \
    --workdir /app \
    ansible:py3.10 \
        ansible all -i hosts -m ping $@
