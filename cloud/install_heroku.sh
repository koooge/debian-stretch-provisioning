#!/bin/bash

# Usage: `./install_heroku.sh`

wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku version
