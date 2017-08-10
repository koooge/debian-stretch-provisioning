#!/bin/bash

# Usage: `./install_digdag.sh && . ~/.bashrc`

curl -o ~/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-latest"
chmod +x ~/bin/digdag
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
