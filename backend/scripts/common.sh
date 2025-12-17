readonly DOCKER_INSTANCE_NAME="server-builder"
readonly DOCKER_FILE_LOCATION="${THIS_SCRIPT_DIR}/../"
export DOCKER_EXE=""

get_exe_path(){
    local exe_name=$1
    which ${exe_name}
}

get_docker_exe(){
    export DOCKER_EXE=$(get_exe_path "docker")
}