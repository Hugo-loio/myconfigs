#!/bin/sh
repo="$HOME/myconfigs"

home_dotfiles="xterm/Xresources profile xinit/xinitrc xinit/xserverrc \
  bash/bash_profile bash/bashrc vim/vimrc" 

config_folder="alacritty/alacritty.yml dunst/dunstrc bspwm/bspwmrc \
  fontconfig/font.conf picom/picom.conf polybar/config polybar/launch.sh \
  ranger/commands.py ranger/commands_full.py ranger/rc.conf ranger/rifle.conf
  ranger/scope.sh sxhkd/sxhkdrc"

echo "This script will replace your configs with the ones on this repo. Do you wish to proced?(y/n)"
while [ true ] ; do
  read answer 
  if [ -z $answer ] ; then 
    continue
  fi
  if [ $answer == "y" ] || [ $answer == "Y" ] ; then
    break
  fi
  if [ $answer == "n" ] || [ $answer == "N" ] ; then
    exit
  fi
done

for dot in $home_dotfiles;do
  file=$HOME/"."$(basename $dot)
  if [ -f $file ];then
    echo "Replaced" $file
    rm $file
  else
    echo "Creating" $file
  fi
  ln -s $repo/$dot $file
done

for conf in $config_folder;do
  dir=$XDG_CONFIG_HOME"/"$(echo $conf | awk -F / '{print $1}')
  file=$XDG_CONFIG_HOME/$conf
  
  if [ ! -d $dir ] ; then
    mkdir $dir
    echo "Created directory" $dir
  fi

  if [ -f $file ];then
    echo "Replaced" $file
    rm $file
  else
    echo "Created" $file
  fi
  ln -s $repo/$conf $file
done


