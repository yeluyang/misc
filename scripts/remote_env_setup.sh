#! /bin/bash

export NEW_USR_NAME="yeluyang"
export PM_INSTALL="apt install -y"
export GIT_USER="${NEW_USR_NAME}"
export GIT_EMAIL="ylycpg@gmail.com"

set -e

command -v curl || ${PM_INSTALL} curl
command -v bison || ${PM_INSTALL} bison
command -v git-lfs || ${PM_INSTALL} git-lfs

adduser -U -m ${NEW_USR_NAME}
cp /etc/sudoers /etc/sudoers.${NEW_USR_NAME}.bak
groupadd -f docker && usermod -aG docker ${NEW_USR_NAME}
echo "${NEW_USR_NAME} ALL=(ALL)	NOPASSWD: ALL" >> /etc/sudoers

su -c "cd ~ && git config --global user.name ${GIT_USER}" ${NEW_USR_NAME}
su -c "cd ~ && git config --global user.email ${GIT_EMAIL}" ${NEW_USR_NAME}

su -c "cd ~ && mkdir -p src/ pkg/ bin/" ${NEW_USR_NAME}
su -c "cd ~ && (command gvm || bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer))" ${NEW_USR_NAME}
su -c "echo \"export GOPATH=\"/home/${NEW_USR_NAME}\"\" >> ~/.bashrc" ${NEW_USR_NAME}

echo "setup finished, please set password for account ${NEW_USR_NAME}"
