FROM nvidia/cuda:10.0-base-ubuntu18.04

RUN apt update
RUN apt install -y --no-install-recommends python3-pip
RUN rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade mxnet-cu100
RUN pip3 install --upgrade autogluon

RUN apt purge -y --autoremove python3-pip
