#!/usr/bin/env bash
ZSH_DIR="${DOTFILES_APPS_DIR}/zsh"

log_install_result() {
  if [ $? -eq 0 ]; then
      info "$1 installed"
  else
      fail "Error installing $1. Exit setup..."
  fi
}

zsh_configure_all() {
  zsh_configure_install
  echo ""
  zsh_configure_config
}

zsh_configure_install() {
  note "Installing zsh"
  sudo apt install zsh -y > /dev/null 2>&1
  [ $? -eq 0 ] && success "Zsh successfully installed." || fail "Error installing zsh. Exit setup..."
}

zsh_configure_config() {
  note "Configuring zsh"
  info "Installing antibody..."
  curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin > /dev/null 2>&1
  log_install_result "antibody"
  echo ""

  info "Installing starship..."
  curl -sS https://starship.rs/install.sh | sudo sh -s -- --yes > /dev/null
  log_install_result "starship"
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

zsh_remove_all() {
  zsh_remove_config
  echo ""

  note "Removing zsh"
  sudo apt remove zsh -y > /dev/null 2>&1
  [ $? -eq 0 ] && success "Zsh successfully removed." || fail "Error removing zsh. Exit setup..."
}

zsh_remove_config() {
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

zsh_diff_all() {
  RESULT=0

  diff -r -q "${ZSH_DIR}/config/.zsh" "${HOME}/.zsh" || RESULT=1
  diff -r -q "${ZSH_DIR}/config/.zprofile" "${HOME}/.zprofile" || RESULT=1
  diff -r -q "${ZSH_DIR}/config/.zshenv" "${HOME}/.zshenv" || RESULT=1
  diff -r -q "${ZSH_DIR}/config/.zshrc" "${HOME}/.zshrc" || RESULT=1


  if [ "$RESULT" -eq 1 ]; then
    warn "ZSH: There are differences between the repository and the installed files."
  else 
    success "ZSH: All files are up to date."
  fi
}