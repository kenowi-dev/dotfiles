#!/usr/bin/env bash

declare ZSH_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

error() { printf "$(tput setaf 1)$1$(tput sgr0)\n"; }
success () { printf "$(tput setaf 2)$1$(tput sgr0)\n"; }
warn () { printf "$(tput setaf 3)$1$(tput sgr0)\n"; }
note() { printf "$(tput setaf 4)$1$(tput sgr0)\n"; }
info() { printf "$(tput setaf 5)$1$(tput sgr0)\n"; }

zsh_usage() {
  echo "Usage: ./install.sh [Options]"
  echo ""
  echo "Options:"
  echo "  help            Show this help message"
  echo "  all             Removes zsh and all its configuration."
  echo "  config-only     Only removes the zsh configuration."
}

remove_zsh() {
  note "################"
  note "Removing zsh"
  sudo apt remove zsh -y > /dev/null 2>&1
  [ $? -eq 0 ] && success "Zsh successfully removed." || fail "Error removing zsh. Exit setup..."
  echo ""
}

remove_zsh_config() {
  note "################"
  note "Removing zsh config"

  warn "Setting Bash as the default Shell. This will need your password."
  sudo chsh -s /bin/bash "$(whoami)"
  [ $? -eq 0 ] && info "Bash set as the default Shell." || fail "Error setting bash as the default shell."
  echo ""

  info "Removing starship..."
  sh -c 'sudo rm "$(command -v 'starship')"'
  [ $? -eq 0 ] && info "starship successfully removed." || fail "Error removing starship. Exit setup..."
  echo ""

  info "Removing .zshrc"
  sudo rm "${HOME}/.zshrc"
    
  info "Removing .zshenv"
  sudo rm "${HOME}/.zshenv"

  info "Removing .zprofile"
  sudo rm "${HOME}/.zprofile"

  info "Removing .zsh config folder"
  sudo rm -r "${HOME}/.zsh"
  echo ""

  success "Zsh configuration succesfully removed."
}

if [ $# -eq 0 ]; then 
  # needs an argument
  zsh_usage
  exit
elif  [ $# -gt 1 ]; then
  error "Too many arguments"
  zsh_usage
  exit 1
fi

case "X$1" in 
  "Xhelp") 
    zsh_usage
    exit
    ;;
  "Xall") 
    remove_zsh
    remove_zsh_config
    exit
    ;;
  "Xconfig-only")
    remove_zsh_config
    exit
    ;;
  *) 
    error "Invalid argument: $1"
    zsh_usage
    exit
    ;;
esac
