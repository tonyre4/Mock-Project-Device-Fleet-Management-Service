THIS_SCRIPT_DIR=$(realpath $(dirname "$0"))
readonly DOCKER_INSTANCE_NAME="server-builder"
readonly DOCKER_FILE_LOCATION="${THIS_SCRIPT_DIR}/../"

get_exe_path(){
    local exe_name=$1
    which ${exe_name}
}

get_docker_exe(){
    export DOCKER_EXE=$(get_exe_path "docker")
}

get_docker_exe

is_docker_image_exists(){
    ${DOCKER_EXE} images -q ${DOCKER_INSTANCE_NAME} | grep -q .
}

build_docker_image(){
    ${DOCKER_EXE} build --progress=plain -t ${DOCKER_INSTANCE_NAME} -f ${DOCKER_FILE_LOCATION}/Dockerfile ${DOCKER_FILE_LOCATION}
}

is_docker_container_running(){
    ${DOCKER_EXE} ps -q --filter "name=${DOCKER_INSTANCE_NAME}" | grep -q .
}

docker_container_exists(){
    ${DOCKER_EXE} ps -a -q --filter "name=${DOCKER_INSTANCE_NAME}" | grep -q .
}

remove_docker_image(){
    if is_docker_image_exists; then
        ${DOCKER_EXE} rmi ${DOCKER_INSTANCE_NAME}
    fi
}

remove_docker_container(){
    if docker_container_exists; then
        ${DOCKER_EXE} rm ${DOCKER_INSTANCE_NAME}
    fi
}

start_docker_container(){
    if is_docker_container_running; then
        echo "Docker container ${DOCKER_INSTANCE_NAME} is already running."
        return
    fi
    if ! is_docker_image_exists; then
        build_docker_image
    fi
    remove_docker_container
    ${DOCKER_EXE} run -d --name ${DOCKER_INSTANCE_NAME} ${DOCKER_INSTANCE_NAME}
}

stop_docker_container(){
    if is_docker_container_running; then
        ${DOCKER_EXE} kill ${DOCKER_INSTANCE_NAME}
        return
    fi
    echo "Docker container ${DOCKER_INSTANCE_NAME} is not running."
}

docker_shell(){
    if ! is_docker_container_running; then
        start_docker_container
    fi
    local command=$1
    if [ -n "${command}" ]; then
        command="-c \"${command}\""
    fi
    ${DOCKER_EXE} exec -it ${DOCKER_INSTANCE_NAME} /bin/bash ${command}
}