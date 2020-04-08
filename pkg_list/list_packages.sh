#!/bin/sh

pacman -Qen > main_repo_packages.txt
pacman -Qem > aur_packages.txt
