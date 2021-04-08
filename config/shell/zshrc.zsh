# setup custom env

export EDITOR=vim

[[ -s "${HOME}/.gvm/scripts/gvm" ]] && source ${HOME}/.gvm/scripts/gvm && export GOPATH=${HOME} && export GOBIN=${GOPATH}/bin && export GOPROXY="https://goproxy.io" && export GO111MODULE="auto"

[[ -s "$HOME/.cargo/env" ]] && source ${HOME}/.cargo/env && export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static && export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

case "$(uname -s)" in
    Linux*)     export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/linuxbrew-bottles";;
    Darwin*)    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles";;
esac

# define custom command

# proxy
# local proxy server
function ss_client() {
        # $1=(start|stop)
	echo "running shadowsocks client with config=/etc/shadowsocks/$2.json, pid-file=/var/run/shadowsocks.$2.pid, log-file=/var/log/shadowsocks.$2.log"
        sudo sslocal -d $1 --pid-file /var/run/shadowsocks.$2.pid --log-file /var/log/shadowsocks.$2.log -c /etc/shadowsocks/$2.json
}
# terminal proxy
export SOCKS_ENDPOINT="socks5://127.0.0.1:1080"
export SOCKS_HTTP_ENDPOINT="http://127.0.0.1:1087"
alias proxy="
        export all_proxy=${SOCKS_ENDPOINT};
        export http_proxy=${SOCKS_HTTP_ENDPOINT};
        export https_proxy=${SOCKS_HTTP_ENDPOINT};
        export ALL_PROXY=${SOCKS_ENDPOINT};
        export HTTP_PROXY=${SOCKS_HTTP_ENDPOINT};
        export HTTPS_PROXY=${SOCKS_HTTP_ENDPOINT};"
alias unproxy="
        unset http_proxy;
        unset https_proxy;
        unset all_proxy;
        unset HTTP_PROXY;
        unset HTTPS_PROXY;
        unset ALL_PROXY;"

function proxy_ssh() {
	tsocks ssh $*
}
