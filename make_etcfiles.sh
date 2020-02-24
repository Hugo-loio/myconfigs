#!/bin/sh

echo "This script will use root permisions" 

# Acpid
sudo cp -r $XDG_CONFIG_HOME/acpid/* /etc/acpi/

#Systemd
sudo cp $XDG_CONFIG_HOME/systemd/logind.conf /etc/systemd/logind.conf

#Xorg
sudo cp $XDG_CONFIG_HOME/xorg/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf


