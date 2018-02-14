#!/bin/bash

# Usage: `./install_node.sh`

shopt -s expand_aliases

NVM_VERSION="v0.33.8"
NODE_VERSION="lts/carbon"

install_nvm() {
  curl -sS -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash
  cp ./.bash.d/node.sh ${HOME}/.bash.d/
  source ${HOME}/.bash.d/node.sh
}

install_node() {
  nvm install ${NODE_VERSION}
  nvm use ${NODE_VERSION}
  nvm alias default ${NODE_VERSION}
}

install_npm_global() {
#  npm install -g aws-sdk
  npm install -g express-generator
}

install_nvm
install_node
install_npm_global

nvm version
node -v
