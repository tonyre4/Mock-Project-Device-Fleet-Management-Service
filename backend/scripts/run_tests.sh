#!/bin/bash

set -e

source $(dirname "$0")/common.sh

main(){
    start_docker_container
    docker_shell "/app/build/tests/unit_tests"
    stop_docker_container
}

main $@