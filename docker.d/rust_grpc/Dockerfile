FROM ubuntu:18.04

RUN apt update

RUN apt install -y curl
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH /root/.cargo/bin:${PATH}
RUN rustup default nightly

RUN apt install -y protobuf-compiler-grpc
RUN apt install -y cmake
RUN apt install -y g++
RUN apt install -y golang
RUN mkdir /go
ENV GOPATH /go
RUN cargo install protobuf-codegen
RUN cargo install grpcio-compiler
