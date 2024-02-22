#!/bin/sh
dir=$(dirname $0)

#1st arg: target file ; 2nd arg: source file
create_symlink(){
  if [ -f $1 ] || [ -h $1 ] ; then
    echo "Replaced" $1
    rm $1
  else
    echo "Created" $1
  fi
  ln -sr $2 $1
}

keymap_dir=/usr/share/kbd/keymaps/custom
[ ! -d $keymap_dir ] && mkdir -p $keymap_dir
create_symlink $keymap_dir/custom_pt-latin1.map $dir/custom_pt-latin1.map
create_symlink /etc/vconsole.conf $dir/vconsole.conf



