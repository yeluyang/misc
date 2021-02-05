#! /bin/bash

set -e

command -v python3 >/dev/null || apt install -y python3
command -v pip3 >/dev/null || apt install -y python3-pip
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

command -v tsocks >/dev/null || apt install -y tsocks
mv /etc/tsocks.conf /etc/tsocks.conf.origin
cat << EOT > /etc/tsocks.conf
server = 127.0.0.1
server_type = 5
server_port = 1086
EOT

command -v connect-proxy >/dev/null || apt install -y connect-proxy

cat << EOT
setup successfully. now please do following things by manually:

  1. edit your own shadowsocks config from '/etc/shadowsocks/example.json'
  2. run command 'sudo sslocal -c /etc/shadowsocks/<your_config>.json -d start'

now, you can use two method to access without jump server:

  1. run 'tsocks ssh username@any.server.ip' to access any server without any configure
  2. config specifed hosts which should access with proxy:
     2.1 write following content in your '.ssh/config':

         Host example.*
          ProxyCommand connect -S 127.0.0.1:1086 %h %p

     2.2 run 'ssh username@example.server.com' to access hosts under domain 'example.*' directly

fxxk the jump server!
EOT
