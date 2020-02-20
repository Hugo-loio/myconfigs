#!/bin/sh

echo "This script will need root permisions" 

sudo cp $XDG_CONFIG_HOME/systemd/logind.conf /etc/systemd/logind.conf
