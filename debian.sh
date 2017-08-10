#!/bin/bash -eu

# Usage: `./debian.sh && . ~/.bash_profile`

install_apt_packages() {
  sudo apt-get -qq update
  sudo apt-get -y upgrade
  sudo apt-get install -y git tmux curl zip unzip \
      gcc g++ make \
      global tig tree jq dos2unix \
      vim
}

install_packages() {
  ./install_ruby.sh
  ./install_node.sh
  ./install_golang.sh
  ./install_java.sh
  ./install_docker.sh
}

install_bash_profile() {
  mkdir -p ${HOME}/.bash.d
  cp .bash_profile ${HOME}/

  cat << \EOS >> ${HOME}/.bash_profile
# prompt
git_branch() {
  echo $(git branch 2> /dev/null | sed -n 's/^\* \(.*\)$/(\1)/p')
}
PS1='[vagrant]\033[01;34m\]$(git_branch)\[\033[00m\]:\w\n\$ '
EOS
}

install_apt_packages
install_bash_profile
curl -L raw.github.com/koooge/dotfiles/master/install.sh | bash

install_packages
