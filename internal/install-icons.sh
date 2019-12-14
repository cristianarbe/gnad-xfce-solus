#!/bin/env sh

installicons() {

  sudo apt-get install papirus-icon-theme > /dev/null
  changeicon "Papirus"
}
