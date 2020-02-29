# My config files 
These are all in a $HOME/.config folder. 
The script make\_dotfiles.sh creates the needed dotfiles outside the .config folder.
When running make\_dotfiles.sh for the firts time please run first
      $export XDG_CONFIG_HOME=$HOME/.config

A list of all the packages I have installed and their description can be found in the /pkg\_list folder (work in progress)

systemd and xorg configs are located in /etc folder and therefore need root permitions to be updated. The script make\_etcfiles.sh updates those
