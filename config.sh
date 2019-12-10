#!/usr/bin/env bash
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
  # package management application for Ruby
  # screen locker
  # sed for JSON
  # create, edit, compose, or convert bitmap images
  # Wayland clipboard utilities
  # Idle management daemon for Wayland
  # wallpaper utility for Wayland compositors
  # Grab images from a Wayland compositor
  # A lightweight Wayland notification daemon
  # adjusts the color temperature of your screen according to your surroundings
  # a bittorrent client
  # an interpreted, interactive, object-oriented programming language
  # A command line interface to the Dropbox service
  # Google Calendar Command Line Interface
  # A shell script static analysis tool
dnf -y install \
  sway \
  i3blocks \
  termite \
  fish \
  firefox \
  rofi \
  tmux \
  gem \
  swaylock \
  jq \
  ImageMagick \
  wl-clipboard \
  swayidle \
  swaybg \
  grim \
  mako \
  redshift \
  transmission-daemon \
  python3 \
  dropbox \
  gcalcli \
  ShellCheck

# remove useless terminals
dnf -y remove \
  gnome-terminal \
  xterm

# use termite instead of xterm
ln -s /usr/bin/termite /usr/bin/xterm

# TUI and CLI for Transmission
# Used for ics/vcal importing.
# Countdown timer and stopwatch in your terminal
# Preview GitHub Markdown files locally.
# Browse Reddit from your terminal
# Language Server Protocol for Python
pip3 install \
  stig \
  vobject \
  termdown \
  grip \
  rtv \
  'python-language-server[all]'

# manage complex tmux sessions easily
gem install tmuxinator
