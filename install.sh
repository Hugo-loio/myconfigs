#!/bin/sh

repo=$(dirname "$0")

export XDG_CONFIG_HOME="$HOME/.config"

#1st arg: target file ; 2nd arg: source file
create_symlink(){
  dir=$(dirname $1)
  if [ ! -d $dir ] ; then
    mkdir -p $dir
  fi

  if [ -f $1 ] || [ -h $1 ] ; then
    echo "Replaced" $1
    rm $1
  else
    echo "Created" $1
  fi
  ln -sr $2 $1
}

#List of dotfiles for home directory
home_dotfiles="profile xinit/xinitrc xinit/xserverrc \
  bash/bash_profile bash/bashrc vim/vimrc readline/inputrc \
  gtk-2.0/gtkrc-2.0" 

#List of files for .config directory
config_folder="dunst/dunstrc bspwm/bspwmrc \
  fontconfig/fonts.conf picom/picom.conf polybar/config.ini polybar/launch.sh \
  ranger/commands.py ranger/commands_full.py ranger/rc.conf ranger/rifle.conf \
  ranger/scope.sh sxhkd/sxhkdrc kitty/kitty.conf mpv/input.conf mpv/mpv.conf \
  rofi/config.rasi rofi/theme.rasi gtk-3.0/settings.ini tmux/tmux.conf \
  zathura/zathurarc "

#List of files for .config directory with no subdirectory
config_folder_no_subdir="betterlockscreen/betterlockscreenrc mime/mimeapps.list"

#List of snippets for .vim/UltiSnips directory
vim_snippets=$(ls $repo/vim/snippets/*.snippets)

#Vim after folder
vim_after=$(find $repo/vim/after -type f)

#Vim colorschemes
vim_color=$(find $repo/vim/colors -type f)

#Vim syntax folder
#vim_syntax=$(find $repo/vim/syntax -type f)

#Vim files
vim_files="$vim_after $vim_color"
#vim_files="$vim_after $vim_syntax"


#Ask user to replace files
echo "This script will replace your configs with the ones on this repo. Do you wish to proceed?(y/n)"
while [ true ] ; do
  read answer 
  if [ -z $answer ] ; then 
    continue
  fi
  if [ "$answer" = "y" ] || [ "$answer" = "Y" ] ; then
    break
  fi
  if [ "$answer" = "n" ] || [ "$answer" = "N" ] ; then
    exit
  fi
done

# Checking if user has root permission and if multilib is enabled
echo "\nThe script requires root permissions" 
sudo -v 2>/dev/null || ( echo "This user doesn't have root permissions" && exit )
sudo pacman -Sl multilib >/dev/null 2>&1 || ( echo "Please enable the multilib repository before proceeding" && exit )

echo "\nInstalling packages..."
sudo pacman -S --needed $(cat $repo/packages/main_repo_packages.txt)
if [ -z "$(which yay 2>/dev/null)" ] ; then
  mkdir $repo/yay
  git clone https://aur.archlinux.org/yay.git $repo/yay
  (cd $repo/yay && makepkg -sic)
  rm -rf $repo/yay
fi
yay -S --needed $(cat $repo/packages/aur_packages.txt)

echo "\nInstalling user configs..."

for dot in $home_dotfiles;do
  target=$HOME/"."$(basename $dot)
  source_file=$repo/$dot
  create_symlink $target $source_file
done

for conf in $config_folder;do
  target=$XDG_CONFIG_HOME/$conf
  source_file=$repo/$conf
  create_symlink $target $source_file
done

for conf in $config_folder_no_subdir;do
  target=$XDG_CONFIG_HOME/$(basename $conf)
  source_file=$repo/$conf
  create_symlink $target $source_file
done

for snip in $vim_snippets;do
  target=$HOME/.vim/UltiSnips/$(basename $snip)
  source_file=$snip
  create_symlink $target $source_file
done

for vf in $vim_files;do
  target=$(echo "$vf" | sed "s|$repo/vim|$HOME/.vim|g")
  source_file=$vf
  create_symlink $target $source_file
done

echo "\nInstalling scripts..."

./$repo/scripts/make_scripts.sh

echo "\nInstalling system configs..."

for conf in $(find -path "$repo/*/make_conf.sh");do
  sudo ./$conf
done



echo "\nCreating cache folder..."
export CACHE="$HOME/.local/share/hugoconf"
if [ ! -d $CACHE ] ; then
  mkdir -p $CACHE
fi

echo "\nCreating other useful folders..."
folders="Documents/books Pictures/wallpapers Desktop Movies Downloads"
for f in $folders ; do
  if [ ! -d $HOME/$f ] ; then
    mkdir -p $HOME/$f
  fi
done

echo "\nEnabling services with systemd..."
#Cups for printing
sudo systemctl enable cups.service
sudo systemctl start cups.service

#Screen saver
sudo systemctl enable betterlockscreen@$USER
sudo systemctl enable betterlockscreen@$USER

#Clock synchronization
sudo systemctl enable ntpd
sudo systemctl start ntpd

#ACPI events
sudo systemctl enable acpid
sudo systemctl start acpid

echo "Done"
