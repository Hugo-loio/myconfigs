# My config files 
These are my config files for archlinux. They include scripts, user config files, and system config files.

The configs are personal. This means that some of the content on this repo will not be useful (or it won't be compatible) for most people.

I am also not responsible for any breakages I might cause in case I upstream wrong code. Having said that, I would never purposefully upstream malware to this repository.

Therefore, I don't recommend that you blindly install these configs on your system. Instead, try them out in a virtual environment or copy (or take inspiration on) specific chunks of source code.

# Getting the configs
There is an install.sh script in the root of the repository. This script will symlink all files in the repository to their respective config files, therefore replacing other config files in the system. It will also install packages and create useful directories. The script will prompt you for root permissions to install packages and system configs.

# Packages

In the directory `packages/` there are two text files (one for AUR and another for main repo) which list all the dependencies necessary for the configs and other extra packages.

TODO: a list will all the packages and their purpose.

# Usage

TODO
