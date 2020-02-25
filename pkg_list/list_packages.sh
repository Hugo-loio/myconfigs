#!/bin/sh

pacman -Qen > $XDG_CONFIG_HOME/pkg_list/main_repo_packages.txt
pacman -Qem > $XDG_CONFIG_HOME/pkg_list/aur_packages.txt
