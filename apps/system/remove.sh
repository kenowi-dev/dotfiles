#!/usr/bin/env bash

error() { printf "$(tput setaf 1)$1$(tput sgr0)\n"; }
success () { printf "$(tput setaf 2)$1$(tput sgr0)\n"; }
warn () { printf "$(tput setaf 3)$1$(tput sgr0)\n"; }
note() { printf "$(tput setaf 4)$1$(tput sgr0)\n"; }
info() { printf "$(tput setaf 5)$1$(tput sgr0)\n"; }

system_usage() {
  echo "Usage: ./remove.sh"
  echo ""
  echo "This task does not take any arguments."
  echo ""
  echo "Removed Settings:"
  echo "  - passwordless sudo"
}

if [ "X$1" = "Xhelp" ]; then 
  system_usage
  exit 
fi

if [ $# -gt 0 ]; then 
  error "Too many arguments"
  system_usage
  exit 1
fi

note "################"
note "Remove system configurations"

USER=$(whoami)
sudo rm"/etc/sudoers.d/$USER"

success "removed passwordless sudo"
