#!/bin/sh

sudo apt update && sudo apt install -y zsh

git clone https://github.com/romkatv/zsh-defer.git ~/zsh-defer

curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin

sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply huideyeren
