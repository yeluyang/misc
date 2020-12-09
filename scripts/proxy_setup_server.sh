#! /bin/bash

set -e

command -v ss-server >/dev/null || (cd /etc/yum.repos.d \
    && curl -O https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo \
    && yum install -y shadowsocks-libev)

cat << EOT > /etc/shadowsocks-libev/config.json
{
    "server": "0.0.0.0",
    "server_port": 10086,
    "password": "fxxkjumpbox",
    "method": "aes-256-cfb",
    "mode": "tcp_and_udp",
    "timeout": 3600
}
EOT
chmod 644 /etc/shadowsocks-libev/config.json

systemctl restart shadowsocks-libev && systemctl enable shadowsocks-libev
