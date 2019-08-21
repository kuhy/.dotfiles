#! /bin/bash
# Author: Kuhy
# Setups system after new installation.
# TODO: make Org file from this

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# enable copr repos
dnf -y copr enable gumieri/sway
dnf -y copr enable wyvie/i3blocks
dnf -y copr enable skidnik/termite

# install packages
  # tiling window manager
  # feed generator for text based status bars
  # keyboard-centric terminal
  # friendly interactive shell
  # web browser
  # window switcher, application launcher and dmenu replacement
  # terminal multiplexer
  # manage complex tmux sessions easily
  # screen locker
  # Wayland clipboard utilities
  # Idle management daemon for Wayland
dnf -y install \
  sway \
  i3blocks \
  termite \
  fish \
  firefox \
  rofi \
  tmux \
  tmuxinator \
  swaylock \
  wl-clipboard \
  swayidle

# set default browser
xdg-settings set default-web-browser firefox.desktop

