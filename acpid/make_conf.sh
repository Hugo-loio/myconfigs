#!/bin/sh

echo "This script will need root permisions" 
sudo cp -r $XDG_CONFIG_HOME/acpid/events /etc/acpi/
sudo cp $XDG_CONFIG_HOME/acpid/handler.sh /etc/acpi/
