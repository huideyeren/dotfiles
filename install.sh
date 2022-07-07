#!/bin/sh

sudo apt update && sudo apt install -y zsh

sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply huideyeren
