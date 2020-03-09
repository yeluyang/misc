FROM yeluyang/rust

RUN apt update
RUN apt install -y --no-install-recommends protobuf-compiler-grpc
RUN apt install -y --no-install-recommends cmake
RUN apt install -y --no-install-recommends g++
RUN apt install -y --no-install-recommends golang
RUN apt install -y --no-install-recommends ca-certificates
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /go
ENV GOPATH /go

RUN cargo install protobuf-codegen
RUN cargo install grpcio-compiler

RUN apt purge -y --autoremove ca-certificates
