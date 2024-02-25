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

icons_dir=$HOME/.icons/default
[ ! -d $icons_dir ] && mkdir -p $icons_dir
create_symlink $icons_dir/index.theme $dir/index.theme
