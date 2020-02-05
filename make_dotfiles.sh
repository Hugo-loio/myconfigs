#!/bin/sh

#make .vimrc
echo ":source $XDG_CONFIG_HOME/vim/vimrc" > ~/.vimrc 

#make .bashrc
echo ". $XDG_CONFIG_HOME/bash/bashrc" > ~/.bashrc 

#make .xinitrc
echo ". $XDG_CONFIG_HOME/xinit/xinitrc" > ~/.xinitrc 

#make .xserverrc
echo ". $XDG_CONFIG_HOME/xserver/xserverrc" > ~/.xserverrc 

#make .profile
echo ". $XDG_CONFIG_HOME/profile" > ~/.profile 

#make .bash_profile
echo ". $XDG_CONFIG_HOME/bash_profile" > ~/.bash_profile 

#make .fehgb
echo ". $XDG_CONFIG_HOME/feh/fehbg" > ~/.fehbg
chmod +x ~/.fehbg

echo "Update lightdm configs (need root permision to be done)?(y/n)"
read response

