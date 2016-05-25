#!/bin/bash

function install {
  echo "Installing Socat"
  if hash apt 2>/dev/null; then
    sudo apt install socat
  elif hash apt-get 2>/dev/null; then
   sudo apt-get install socat
  elif hash pacman 2>/dev/null; then
   sudo pacman -S socat
  elif hash dnf 2>/dev/null; then
   sudo dnf install socat
  elif hash yum 2>/dev/null; then
   sudo yum install socat
  else
    echo "Unable to install socat"
    exit 1;
  fi
}

function run {
  sudo socat -d -d -d -d  PTY,link=/dev/ttyVirtualS0,echo=0 PTY,link=/dev/ttyVirtualS1,echo=0
}

if hash socat 2>/dev/null; then
    run
else
   install
   run
fi
