#!/bin/bash

# Usage: `./install_embulk.sh`

curl -sS --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar"
chmod +x ~/.embulk/bin/embulk
cp ./.bash.d/embulk.sh ${HOME}/.bash.d/
