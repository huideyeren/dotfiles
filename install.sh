#!/bin/sh

if [[ -f /etc/os-release ]]; then
  source /usr/lib/os-release
  case $ID in
    debian ) sudo apt update && sudo apt install -y zsh;;
    ubuntu ) sudo apt update && sudo apt install -y zsh;;
    fedora ) sudo dnf update && sudo dnf group install -y "Development Tools" && sudo dnf install -y wget tar zsh && sudo dnf install -y gcc zlib-devel bzip2 bzip2-devel readline readline-devel sqlite sqlite-devel openssl openssl-devel git libffi-devel tar make;;
    centos ) sudo dnf update && sudo dnf group install -y "Development Tools" && sudo dnf install -y wget tar zsh && sudo dnf install -y gcc zlib-devel bzip2 bzip2-devel readline readline-devel sqlite sqlite-devel openssl openssl-devel git libffi-devel tar make;;
    miraclelinux ) sudo dnf update && sudo dnf group install -y "Development Tools" && sudo dnf install -y wget tar zsh && sudo dnf install -y gcc zlib-devel bzip2 bzip2-devel readline readline-devel sqlite sqlite-devel openssl openssl-devel git libffi-devel tar make;;
    opensuse ) sudo udo zypper --non-interactive install zsh;;
    alpine ) sudo apk install git && sudo apk install zsh && sudo apk install tar && sudo apk install wget;;
  esac
fi

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
    miraclelinux ) sudo dny -y install golang;;
    opensuse ) sudo udo zypper --non-interactive install golang;;
    alpine ) sudo apk install golang;;
  esac
else
    echo "/etc/os-release is not exist."
fi

# chezmoi
git clone https://github.com/twpayne/chezmoi.git
cd chezmoi
make install

chezmoi init https://github.com/huideyeren/dotfiles.git
