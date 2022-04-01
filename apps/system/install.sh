#!/usr/bin/env bash

declare SYSTEM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

error() { printf "$(tput setaf 1)$1$(tput sgr0)\n"; }
success () { printf "$(tput setaf 2)$1$(tput sgr0)\n"; }
warn () { printf "$(tput setaf 3)$1$(tput sgr0)\n"; }
note() { printf "$(tput setaf 4)$1$(tput sgr0)\n"; }
info() { printf "$(tput setaf 5)$1$(tput sgr0)\n"; }

system_usage() {
  echo "Usage: ./install.sh [Options]"
  echo ""
  echo "Installed Settings:"
  echo "  - passwordless sudo"
  echo ""
  echo "Options:"
  echo "  help            Show this help message"
  echo "  config-only     The same as without any arguments."
}

configure_system() {
  note "################"
  note "Configuring system"
  USER=$(whoami)
  sudo sed "s/username/$(whoami)/" "$SYSTEM_DIR/config/user" | sudo tee "/etc/sudoers.d/$USER" > /dev/null
  success "passwordless sudo configured successfully"
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
    configure_system
    exit
    ;;
  "Xconfig-only")
    configure_system
    exit
    ;;
  *) 
    error "Invalid argument: $1"
    system_usage
    exit
    ;;
esac


