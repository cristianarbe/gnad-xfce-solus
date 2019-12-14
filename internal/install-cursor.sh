#!/bin/env sh
installcursor() {
    sudo apt-get install breeze-cursor-theme >/dev/null
    changecursor breeze_cursor
}
