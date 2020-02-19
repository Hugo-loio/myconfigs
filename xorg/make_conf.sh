#!/bin/sh

#if [ $EUID -ne 0 ]; then
   echo "This script will need root permisions" 
#   exit 1
#fi

sudo cp $XDG_CONFIG_HOME/xorg/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
