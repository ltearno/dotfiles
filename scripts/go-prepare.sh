#!/bin/bash

function goprepare() {
    export GOPATH=$(pwd)
    echo -e "\nswitched to GOPATH ${GOPATH}\n"
    go env
    echo
}