# setup custom env

export EDITOR=vim

source ${HOME}/.gvm/scripts/gvm && export GOPATH=${HOME} && export GOBIN=${GOPATH}/bin && export GOPROXY="https://goproxy.io" && export GO111MODULE="auto"

export RUSTUP_DIST_SERVER="https://mirrors.tuna.tsinghua.edu.cn/rustup" && export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup && source ${HOME}/.cargo/env

# define custom command

# proxy
# local proxy server
function ss_client() {
        # $1=(start|stop)
        sudo sslocal -d $1 -c /etc/shadowsocks/$2.json
}
# terminal proxy
alias proxy="export http_proxy=http://127.0.0.1:1080; export https_proxy=https://127.0.0.1:1080; export all_proxy=socks5://127.0.0.1:1080"
alias unproxy="unset http_proxy; unset https_proxy"
