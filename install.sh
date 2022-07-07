#!/bin/sh

sudo apt update && sudo apt install -y zsh git

git clone https://github.com/romkatv/zsh-defer.git ~/zsh-defer

sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply huideyeren
