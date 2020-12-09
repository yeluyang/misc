#! /bin/bash

set -e

command -v python3 >/dev/null || apt install python3
command -v pip3 >/dev/null || apt install python3-pip
pip3 install shadowsocks
mkdir -p /etc/shadowsocks
cat << EOT > /etc/shadowsocks/example.json
{
    "local_address": "127.0.0.1",
    "local_port": 1086,
    "timeout":600,
    "server": "example.server.ip",
    "server_port":10086,
    "password":"fxxkjumpbox",
    "mode": "tcp_and_udp",
    "method":"aes-256-cfb"
}
EOT

command -v tsocks >/dev/null || apt install tsocks
mv /etc/tsocks.conf /etc/tsocks.conf.origin
cat << EOT > /etc/tsocks.conf
server = 127.0.0.1
server_type = 5
server_port = 1086
EOT

cat << EOT
setup successfully. now please do following things by manually:
    1. edit your own shadowsocks config from '/etc/shadowsocks/example.json'
    2. run command 'sudo sslocal -c '/etc/shadowsocks/<your_config>.json -d start'
now, you can run 'tsocks ssh username@server.ip' to access without jump server.
fxxk jump server.
EOT
