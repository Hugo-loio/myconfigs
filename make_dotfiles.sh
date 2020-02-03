#!/bin/sh

#make .vimrc
echo ":source $XDG_CONFIG_HOME/vim/vimrc" > ~/.vimrc 

#make .bashrc
echo ". $XDG_CONFIG_HOME/bash/bashrc" > ~/.bashrc 

#make .xinitrc
echo ". $XDG_CONFIG_HOME/xinit/xinitrc" > ~/.xinitrc 

#make .xprofile (same as xinitrc)
echo ". $XDG_CONFIG_HOME/xinit/xinitrc" > ~/.xprofile 

#make .xserverrc
echo ". $XDG_CONFIG_HOME/xserver/xserverrc" > ~/.xserverrc 

#make .profile
echo ". $XDG_CONFIG_HOME/profile" > ~/.profile 

#make .bash_profile
echo ". $XDG_CONFIG_HOME/bash_profile" > ~/.bash_profile 

echo "Update lightdm configs (need root permision to be done)?(y/n)"
read response

if [ "$response" = "y" ]
then
  #make lightdm.conf
  sudo cp $XDG_CONFIG_HOME/lightdm/lightdm.conf /etc/lightdm/lightdm.conf

  #make lightdm-webkit2-greeter.conf
  sudo cp $XDG_CONFIG_HOME/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/lightdm-webkit2-greeter.conf
else
  echo "Lightdm configs not updated."
fi
