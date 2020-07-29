# My config files 
These are my config files for archlinux. They include scripts, user config files, and system config files.

# Getting the configs
There is an install.sh script in the root of the repository. This script will symlink all files in the repository to their respective config files, therefore replacing other config files in the system. It will also install all dependencies. The script will prompt you for root permissions to install dependencies and system configs.

I wouldn't advise you to blindly install these. Although there is no malware in the config files, I can't promise I won't upstream a change that might break something in your system, or that the configs will work just fine in all systems out of the box. I will however strive to make the configs easily installable, for myself, and so you can try them in a virtual environment, which is what I recommend. This way you can see what features you like and freely copy or take inspiration from the source code in this repository.

# Dependencies

In the directory `dependencies/` there are two text files (one for AUR and another for main repo) which list all the dependencies necessary for the configs.

TODO: a list will all the dependencies and their purpose.

# Extra stuff

I have an [extraconfigs](https://github.com/Hugo-loio/extraconfigs) repo which complements the configs in this repo. 

I have made the separation because over at [extraconfigs](https://github.com/Hugo-loio/extraconfigs) is where I place more personal configs, scripts, and packages. Still, a couple of things there might be of use to some people so feel free to check it out.

