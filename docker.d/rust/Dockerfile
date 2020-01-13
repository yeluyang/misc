FROM ubuntu:18.04

RUN apt update

RUN apt install -y --no-install-recommends curl
RUN rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN apt purge -y --autoremove curl

ENV PATH /root/.cargo/bin:${PATH}
RUN rustup default nightly
