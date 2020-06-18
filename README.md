# My config files 
These are meant to be symlinked to their rightfull location on the system. 

## Getting the configs
The script make\_dotfiles.sh creates all the necessary symlinks automatically (replacing all existing config files). Please take the following precautions before running the script.
If the environment variable XDG\_CONFIG\_HOME isn't already set, please run the following command before executing the script:

	$export XDG_CONFIG_HOME=$HOME/.config

## Dependencies and settings specific to my system
In profile I define environment variables, like MONITOR (which corresponds to the name of the main monitor), which might be specific to my system or to the software I am using.

Often I use scripts present in my scripts repository.

## Other usefull software
A list of all the packages I have installed and their description can be found in the /pkg\_list folder (work in progress)

## system configs
xorg configs are located in /etc folder and therefore need root permitions to be updated. The script make\_etcfiles.sh updates those
