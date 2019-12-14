#!/bin/env sh

changewmtheme() {
  xfconf-query -c xfwm4 -p /general/theme -s "$1"
}

changetheme() {
  xfconf-query -c xsettings -p /Net/ThemeName -s "$1"
}

changeicon() {
  xfconf-query -c xsettings -p /Net/IconThemeName -s "$1"
}

changepanel() {
  if pgrep xfconfd > /dev/null; then
    pkill xfconfd
  fi
  if pgrep xfce4-panel > /dev/null; then
    pkill xfce4-panel
  fi
  cp -r "$1" ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
  rm -rf ~/.config/xfce4/panel/*
  cp -r "$2/"* ~/.config/xfce4/panel/
  xfce4-panel >/dev/null 2>&1 &
  /usr/lib/x86_64-linux-gnu/xfce4/xfconf/xfconfd >/dev/null 2>&1 &
}

changefont() {
  xfconf-query -c xfwm4 -p /general/title_font -s "$1"
  xfconf-query -c xsettings -p /Gtk/FontName -s "$1"
}

changewallpaper() {
  if test ! -d ~/.backgrounds; then
    mkdir -p ~/.backgrounds
  fi

  cp "$1" ~/.backgrounds/wallpaper

  property="$(xfconf-query -c xfce4-desktop -l | grep image-path | head -n 1)"
  xfconf-query -c xfce4-desktop -p "$property" -s ~/.backgrounds/wallpaper

  property="$(xfconf-query -c xfce4-desktop -l | grep workspace | grep last-image | head -n 1)"
  xfconf-query -c xfce4-desktop -p "$property" -s ~/.backgrounds/wallpaper
}

changecursor(){
  xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "$1"
}
