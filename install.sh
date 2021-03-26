#!/bin/bash

while [[ $# -gt 0 ]]
do
key="$1"
arguments=""

case $key in
    --tags)
    TAGS="--tags $2"
    shift # past argument
    shift # past value
    ;;
    --skip-tags)
    SKIP_TAGS="--skip-tags $2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    echo "Unknown parameter." 1>&2
    exit 1
    ;;
esac
done


if ! [ -x "$(command -v ansible)" ]; 
then

  if [ "$(lsb_release -is)" = Ubuntu ]
  then
      echo "ubuntu"
      sudo apt-add-repository ppa:ansible/ansible
      sudo apt install ansible      
  elif [ "$(lsb_release -is)" = Fedora ]
  then
      echo "fedora"
      sudo dnf install ansible
  else
    echo "Cant install ansible for your distro. Please install ansible manually and run this script again." 1>&2
    exit 1
  fi
  
fi

ansible-playbook setup.yml $TAGS $SKIP_TAGS
