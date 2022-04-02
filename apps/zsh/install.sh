#!/usr/bin/env bash

declare ZSH_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

error() { printf "$(tput setaf 1)$1$(tput sgr0)\n"; }
success () { printf "$(tput setaf 2)$1$(tput sgr0)\n"; }
warn () { printf "$(tput setaf 3)$1$(tput sgr0)\n"; }
note() { printf "$(tput setaf 4)$1$(tput sgr0)\n"; }
info() { printf "$(tput sgr0)$1$(tput sgr0)\n"; }

zsh_usage() {
  echo "Usage: ./install.sh [Options]"
  echo ""
  echo "Options:"
  echo "  help            Show this help message"
  echo "  install-only    Optional: Only installs zsh, without configureing it."
  echo "  config-only     Optional: Only configures zsh. If zsh is not installed, this will do nothing."
  echo ""
  echo "If no options are give, zsh will be installed and configured."
}

install_result() {
  if [ $? -eq 0 ]; then
      info "$1 installed"
  else
      fail "Error installing $1. Exit setup..."
  fi
}

install_zsh() {
  note "################"
  note "Installing zsh"
  sudo apt install zsh -y > /dev/null 2>&1
  [ $? -eq 0 ] && success "Zsh successfully installed." || fail "Error installing zsh. Exit setup..."
  echo ""
}

configure_zsh() {
  note "################"
  note "Configuring zsh"
  info "Installing antibody..."
  curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin > /dev/null 2>&1
  install_result "antibody"
  echo ""

  info "Installing starship..."
  curl -sS https://starship.rs/install.sh | sudo sh -s -- --yes > /dev/null
  install_result "starship"
  echo ""
  
  warn "Setting ZSH as the default Shell. This will need your password."
  chsh -s $(which zsh)
  [ $? -eq 0 ] && info "Zsh set as the default Shell." || fail "Error setting zsh as the default shell."
  echo ""

  info "Copying .zshrc"
  cp "${ZSH_DIR}/config/.zshrc" "${HOME}/.zshrc"
    
  info "Copying .zshenv"
  cp "${ZSH_DIR}/config/.zshenv" "${HOME}/.zshenv"

  info "Copying .zprofile"
  cp "${ZSH_DIR}/config/.zprofile" "${HOME}/.zprofile"

  info "Copying .zsh config folder"
  cp -r "${ZSH_DIR}/config/.zsh" "${HOME}"
  echo ""

  success "Zsh successfully configured."
}

if [ $# -gt 1 ]; then 
  error "Too many arguments"
  zsh_usage
  exit 1
fi

case "X$1" in 
  "X") 
    install_zsh
    configure_zsh
    exit
    ;;
  "Xhelp") 
    zsh_usage
    exit
    ;;
  "Xinstall-only") 
    install_zsh
    exit
    ;;
  "Xconfig-only")
    configure_zsh
    exit
    ;;
  *) 
    error "Invalid argument: $1"
    zsh_usage
    exit
    ;;
esac