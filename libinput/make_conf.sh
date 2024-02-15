#!/bin/sh
repo=$(dirname $0)

#1st arg: target file ; 2nd arg: source file
create_symlink(){
  if [ -f $1 ] || [ -h $1 ] ; then
    echo "Replaced" $1
    rm $1
  else
    echo "Created" $1
  fi
  ln -sr $2 $1
}

#Xorg
create_symlink /etc/X11/xorg.conf.d/30-touchpad.conf $repo/30-touchpad.conf 



