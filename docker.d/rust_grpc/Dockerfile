FROM yeluyang/rust

RUN apt update
RUN apt install -y protobuf-compiler-grpc
RUN apt install -y cmake
RUN apt install -y g++
RUN apt install -y golang
RUN mkdir /go
ENV GOPATH /go
RUN cargo install protobuf-codegen
RUN cargo install grpcio-compiler
