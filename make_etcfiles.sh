#!/bin/sh
repo=$(dirname $0)

echo "This script will use root permisions" 

#Xorg
sudo cp $repo/xorg/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf



