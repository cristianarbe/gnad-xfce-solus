#!/bin/env sh

installtheme() {
  if test ! -d ~/.themes; then
    mkdir -p ~/.themes
  fi

  cd ~/.themes || exit
  if test ! -d Plata-Noir; then
    wget https://github.com/cristianarbe/plata-theme/releases/download/v1.0/plata-theme.tgz -O plata.tgz
    extract plata.tgz
  fi

  changewmtheme Plata-Noir
  changetheme Plata-Noir

}
