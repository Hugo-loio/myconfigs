#!/bin/sh

#make .vimrc
#TODO ask for permition to delete .vimrc if it exists
ln -s $XDG_CONFIG_HOME/vim/vimrc $HOME/.vimrc

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

#make .gtkrc-2.0
#file=$HOME/.gtkrc-2.0
#if [ ! -f $file ]; 
#then
#  echo "Symlink for gtkrc-2.0 will be created"
#  ln -s $XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0  $file
#else
#  echo "Symlink for gtkrc-2.0 already exists"
#fi

