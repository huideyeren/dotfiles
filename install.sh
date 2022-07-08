#!/bin/sh

# zsh-defer
git clone https://github.com/romkatv/zsh-defer.git ~/zsh-defer

# golang
if [[ -f /etc/os-release ]]; then
  source /usr/lib/os-release
  case $ID in
    debian ) sudo apt update && sudo apt install -y golang;;
    ubuntu ) sudo apt update && sudo apt install -y golang;;
    fedora ) sudo dnf -y install golang;;
    centos ) sudo dnf -y install golang;;
    opensuse ) sudo udo zypper --non-interactive install golang;;
    alpine ) sudo apk install golang;;
  esac
else
    echo "/etc/os-release is not exist."
fi


# chezmoi

sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply huideyeren
