#!/usr/bin/env bash

error() { printf "$(tput setaf 1)$1$(tput sgr0)\n"; }
success () { printf "$(tput setaf 2)$1$(tput sgr0)\n"; }
warn () { printf "$(tput setaf 3)$1$(tput sgr0)\n"; }
note() { printf "$(tput setaf 4)$1$(tput sgr0)\n"; }
info() { printf "$(tput setaf 5)$1$(tput sgr0)\n"; }

system_usage() {
  echo "Usage: ./remove.sh [Options]"
  echo ""
  echo "Removed Settings:"
  echo "  - passwordless sudo"
  echo ""
  echo "Options:"
  echo "  help            Show this help message"
  echo "  config-only     The same as without any arguments."
}

remove_system_config() {
  note "################"
  note "Remove system configurations"
  USER=$(whoami)
  sudo rm"/etc/sudoers.d/$USER"
  success "removed passwordless sudo"
}

if [ $# -gt 1 ]; then 
  error "Too many arguments"
  system_usage
  exit 1
fi

case "X$1" in 
  "Xhelp") 
    system_usage
    exit
    ;;
  "X") 
    remove_system_config
    exit
    ;;
  "Xconfig-only")
    remove_system_config
    exit
    ;;
  *) 
    error "Invalid argument: $1"
    system_usage
    exit
    ;;
esac

