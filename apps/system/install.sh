#!/usr/bin/env bash

declare SYSTEM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

error() { printf "$(tput setaf 1)$1$(tput sgr0)\n"; }
success () { printf "$(tput setaf 2)$1$(tput sgr0)\n"; }
warn () { printf "$(tput setaf 3)$1$(tput sgr0)\n"; }
note() { printf "$(tput setaf 4)$1$(tput sgr0)\n"; }
info() { printf "$(tput setaf 5)$1$(tput sgr0)\n"; }

system_usage() {
  echo "Usage: ./install.sh"
  echo ""
  echo "This task does not take any arguments."
  echo ""
  echo "Configured Settings:"
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
note "Configuring system"

USER=$(whoami)
sudo cp "$SYSTEM_DIR/config/user" "/etc/sudoers.d/$USER"
sudo sed -i "s/username/$(whoami)/" "/etc/sudoers.d/$USER"

success "passwordless sudo configured successfully"
