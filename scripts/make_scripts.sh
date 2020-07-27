#!/bin/sh

#1st arg: target file ; 2nd arg: source file
create_symlic(){
  if [ -f $1 ] || [ -h $1 ] ; then
    echo "Replaced" $1
    rm $1
  else
    echo "Created" $1
  fi
  ln -sr $2 $1
}

#Folder where scripts are located in repo
folder=$(dirname "$0")

scripts=$(find $folder -mindepth 2)

script_folder=$HOME/.local/bin
if [ ! -d $script_folder ] ; then
  mkdir $script_folder
fi

for script in $scripts;do
  target=$HOME/.local/bin/$(basename $script)
  create_symlic $target $script
done
