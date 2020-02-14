#!/bin/sh

#make .vimrc
echo ":source $XDG_CONFIG_HOME/vim/vimrc" > $HOME/.vimrc 

#make .bashrc
echo ". $XDG_CONFIG_HOME/bash/bashrc" > $HOME/.bashrc 

#make .xinitrc
echo ". $XDG_CONFIG_HOME/xinit/xinitrc" > $HOME/.xinitrc 

#make .xserverrc
echo ". $XDG_CONFIG_HOME/xserver/xserverrc" > $HOME/.xserverrc 

#make .profile
echo ". $XDG_CONFIG_HOME/profile" > $HOME/.profile 

#make .bash_profile
echo ". $XDG_CONFIG_HOME/bash_profile" > $HOME/.bash_profile 

#make .fehgb
echo ". $XDG_CONFIG_HOME/feh/fehbg" > $HOME/.fehbg
chmod +x ~/.fehbg

#make .stalonetrayrc
file=$HOME/.stalonetrayrc
if [ ! -f $file ]; 
then
  echo "Symlink for stalonetray will be created"
  ln -s $XDG_CONFIG_HOME/stalonetray/stalonetrayrc $HOME/.stalonetrayrc 
else
  echo "Symlink for stalonetray already exists"
fi

