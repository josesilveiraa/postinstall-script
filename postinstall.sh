install_yay() {
  pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si
}

sync() {
  pacman -Syyu
}

install_package() {
  pacman -S $1
}

install_yay_package() {
  yay -S $1
}

install_nerd_font() {
  curl -O https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
  unzip ./JetBrainsMono.zip -d ./JetBrainsMono
  find ./JetBrainsMono -type f -name '*Windows*' -delete
  mv ./JetBrainsMono/* /usr/share/fonts
  rm -rf ./JetBrainsMono ./JetBrainsMono.zip
}

install_nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
}

install_docker() {
  install_package docker
  install_package docker-compose
  systemctl start docker.service
  usermod -aG docker $USER
}

sync

install_yay

# Programming
install_docker
install_package code
install_package alacritty

# Other
install_package unzip
install_package firefox
install_package ardour
install_package kdenlive
install_package audacity
install_package mpv
install_package qbittorrent
install_package discord-canary

install_yay_package mirage
install_yay_package insomnia
install_yay_package spotify

# Games
install_package lutris
install_package steam

# Nerd Fonts for Alacritty
install_nerd_font

install_nvm

mv ./alacritty.bckp.yml ~/.config/alacritty/alacritty.yml