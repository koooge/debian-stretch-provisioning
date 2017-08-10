#!/bin/bash

# Usage: `./install_node.sh`

shopt -s expand_aliases

NVM_VERSION="v0.33.2"
NODE_VERSION="lts/boron"

install_nvm() {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash
  cp ./.bash.d/node.sh ${HOME}/.bash.d/
  source ${HOME}/.bash.d/node.sh
}

install_node() {
  nvm install ${NODE_VERSION}
  nvm use ${NODE_VERSION}
}

install_nvm
install_node

nvm version
node -v
