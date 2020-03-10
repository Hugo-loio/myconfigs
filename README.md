# My config files 
These are meant to be symlinked to their rightfull location on the system. 

## Getting the configs
The script make\_dotfiles.sh creates all the necessary symlinks automatically (replacing all existing config files). Please take the following percautions before running the script.
If this repo wasn't cloned into ~/myconfigs/ please change the variable $repo in make\_dotfiles.sh to the correct folder before running it.
If the environment variable XDG\_CONFIG\_HOME isn't already set, please run the following command before executing the script:
      $export XDG_CONFIG_HOME=$HOME/.config

## Other usefull software
A list of all the packages I have installed and their description can be found in the /pkg\_list folder (work in progress)

## system configs
xorg configs are located in /etc folder and therefore need root permitions to be updated. The script make\_etcfiles.sh updates those
