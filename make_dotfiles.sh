#!/bin/sh
repo="$HOME/myconfigs"

#List of dotfiles for home directory
home_dotfiles="profile xinit/xinitrc xinit/xserverrc \
  bash/bash_profile bash/bashrc vim/vimrc" 

#List of files for .config directory
config_folder="dunst/dunstrc bspwm/bspwmrc \
  fontconfig/font.conf picom/picom.conf polybar/config polybar/launch.sh \
  ranger/commands.py ranger/commands_full.py ranger/rc.conf ranger/rifle.conf \
  ranger/scope.sh sxhkd/sxhkdrc kitty/kitty.conf mpv/input.conf mpv/mpv.conf"

#List of snippets for .vim/UltiSnips directory
vim_snippets=$(ls $repo/vim/snippets/*.snippets)

#Ask user to replace files
echo "This script will replace your configs with the ones on this repo. Do you wish to proced?(y/n)"
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

#1st arg: target file ; 2nd arg: source file
create_symlic(){
  dir=$(dirname $1)
  if [ ! -d $dir ] ; then
    mkdir -p $dir
    echo "Created directory" $dir
  fi

  if [ -f $1 ];then
    echo "Replaced" $1
    rm $1
  else
    echo "Created" $1
  fi
  ln -s $2 $1
}

for dot in $home_dotfiles;do
  target=$HOME/"."$(basename $dot)
  source_file=$repo/$dot
  create_symlic $target $source_file
done

for conf in $config_folder;do
  target=$XDG_CONFIG_HOME/$conf
  source_file=$repo/$conf
  create_symlic $target $source_file
done

for snip in $vim_snippets;do
  target=$HOME/.vim/UltiSnips/$(basename $snip)
  source_file=$snip
  create_symlic $target $source_file
done

