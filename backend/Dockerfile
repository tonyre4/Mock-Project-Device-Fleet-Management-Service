FROM ubuntu:22.04

RUN apt-get update && apt-get install -y build-essential cmake libgrpc++-dev protobuf-compiler-grpc libprotobuf-dev pkg-config

COPY . /app/

RUN ls /app/*

RUN mkdir -p /app/build

RUN cd /app/build && cmake .. && make -j$(nproc)

CMD ["/app/build/DeviceFleetServer"]