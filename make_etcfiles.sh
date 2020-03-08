#!/bin/sh

echo "This script will use root permisions" 

#Xorg
sudo cp $XDG_CONFIG_HOME/xorg/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf



