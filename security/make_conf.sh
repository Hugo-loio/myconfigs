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

create_symlink /etc/security/faillock.conf $folder/faillock.conf
create_symlink /etc/pam.d/system-login $folder/system-login
