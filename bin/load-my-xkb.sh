#!/bin/sh
set -eu
xkbcomp -I${HOME}/.xkb ~/.xkb/keymap/mykbd $DISPLAY 2> /dev/null
