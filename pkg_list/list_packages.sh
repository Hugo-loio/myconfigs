#!/bin/sh

pacman -Qen > $XDG_CONFIG_HOME/main_repo_packages.txt
pacman -Qem > $XDG_CONFIG_HOME/aur_packages.txt
