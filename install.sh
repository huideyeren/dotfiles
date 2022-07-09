#!/bin/sh

if [[ -f /etc/os-release ]]; then
  source /usr/lib/os-release
  case $ID in
    debian ) sudo apt update && sudo apt install -y zsh && sudo apt install -y build-essential libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev libreadline-dev libsqlite3-dev libopencv-dev tk-dev git;;
    ubuntu ) sudo apt install -y software-properties-common && sudo add-apt-repository ppa:longsleep/golang-backports && sudo apt update && sudo apt install -y zsh && sudo apt install -y build-essential libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev libreadline-dev libsqlite3-dev libopencv-dev tk-dev git;;
    fedora ) sudo dnf update && sudo dnf group install -y "Development Tools" && sudo dnf install -y wget tar zsh && sudo dnf install -y gcc zlib-devel bzip2 bzip2-devel readline readline-devel sqlite sqlite-devel openssl openssl-devel git libffi-devel tar make;;
    centos ) sudo dnf update && sudo dnf group install -y "Development Tools" && sudo dnf install -y wget tar zsh && sudo dnf install -y gcc zlib-devel bzip2 bzip2-devel readline readline-devel sqlite sqlite-devel openssl openssl-devel git libffi-devel tar make;;
    miraclelinux ) sudo dnf update && sudo dnf group install -y "Development Tools" && sudo dnf install -y wget tar zsh && sudo dnf install -y gcc zlib-devel bzip2 bzip2-devel readline readline-devel sqlite sqlite-devel openssl openssl-devel git libffi-devel tar make;;
    opensuse ) sudo udo zypper --non-interactive install zsh && sudo zypper --non-interactive install --type pattern devel_basis && sudo zypper --non-interactive install gcc automake bzip2 libbz2-devel xz xz-devel openssl-devel ncurses-devel readline-devel zlib-devel tk-devel libffi-devel sqlite3-devel go go-doc go-vim subversion mercurial mercurial-lang git;;
    opensuse-leap ) sudo udo zypper --non-interactive install zsh && sudo zypper --non-interactive install --type pattern devel_basis && sudo zypper --non-interactive install gcc automake bzip2 libbz2-devel xz xz-devel openssl-devel ncurses-devel readline-devel zlib-devel tk-devel libffi-devel sqlite3-devel go go-doc go-vim subversion mercurial mercurial-lang git;;
    alpine ) apk add --update-cache --no-cache git bash build-base libffi-dev openssl-dev bzip2-dev zlib-dev xz-dev readline-dev sqlite-dev tk-dev zsh tar wget;;
  esac
fi

# zsh-defer
git clone https://github.com/romkatv/zsh-defer.git ~/zsh-defer

# golang
if [[ -f /etc/os-release ]]; then
  source /usr/lib/os-release
  case $ID in
    alpine ) apk add --update-cache --no-cache vim git make musl-dev go curl;;
    * ) curl -Lo go_installer https://get.golang.org/linux && chmod +x go_installer && ./go_installer && rm go_installer;;
  esac
fi

# chezmoi
git clone https://github.com/twpayne/chezmoi.git ~/chezmoi
cd ~/chezmoi 
make install

chezmoi init https://github.com/huideyeren/dotfiles.git
