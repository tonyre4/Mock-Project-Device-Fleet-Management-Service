FROM ubuntu:22.04

RUN apt-get update && apt-get install -y protobuf-compiler protobuf-compiler-grpc

COPY DeviceFleet.proto /proto/DeviceFleet.proto
ENV PY_OUT=/protoOut/cli/src/DeviceFleetCLI/proto
ENV CPP_OUT=/protoOut/backend/src/proto

RUN mkdir -p ${CPP_OUT}
RUN mkdir -p ${PY_OUT}

RUN cat /proto/DeviceFleet.proto

RUN protoc --cpp_out=${CPP_OUT} --python_out=${PY_OUT} --grpc_out=${CPP_OUT} --plugin=protoc-gen-grpc=`which grpc_cpp_plugin` --proto_path=/proto DeviceFleet.proto

RUN tar -cvf /proto/ProtoFiles.tar -C /protoOut .