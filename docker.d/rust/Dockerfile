FROM ubuntu:18.04

RUN apt update

RUN apt install -y --no-install-recommends curl
RUN apt install -y --no-install-recommends ca-certificates
RUN rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ENV PATH /root/.cargo/bin:${PATH}
RUN rustup default nightly

RUN apt purge -y --autoremove curl
RUN apt purge -y --autoremove ca-certificates
