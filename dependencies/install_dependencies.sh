#!/bin/sh

repo=$(dirname "$0")

pacman -S --needed $(cat $repo/main_repo_dependencies.txt)
