#!/bin/sh

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

#Folder where scripts are located in repo
folder=$(dirname "$0")

cp $folder/09-timezone /etc/NetworkManager/dispatcher.d/09-timezone 
chown root:root /etc/NetworkManager/dispatcher.d/09-timezone
chmod 700 /etc/NetworkManager/dispatcher.d/09-timezone
