#!/bin/sh

#make .vimrc
echo ":source ~/.config/vim/vimrc" > ~/.vimrc 

#make .bashrc
echo ". ~/.config/bash/bashrc" > ~/.bashrc 

#make .xinitrc
echo ". ~/.config/xinit/xinitrc" > ~/.xinitrc 
