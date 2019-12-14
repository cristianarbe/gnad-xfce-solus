#!/bin/env sh

installfonts() {
    if test ! -d ~/.fonts; then
        mkdir -p ~/.fonts
    fi

    if test ! -f ~/.fonts/OpenSans-Regular.ttf; then
        wget https://www.fontsquirrel.com/fonts/download/clear-sans -O ~/.fonts/clear.zip
        cd ~/.fonts || exit
        extract clear.zip
    fi
    changefont "Clear Sans 11"

}
