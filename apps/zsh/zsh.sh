#!/usr/bin/env bash
ZSH_DIR="${DOTFILES_APPS_DIR}/zsh"

log_install_result() {
  if [ $? -eq 0 ]; then
      process_step "$1 installed"
  else
      process_fail "Error installing $1. Exit setup..."
  fi
}

zsh_configure_all() {
  zsh_configure_install
  zsh_configure_config
}

zsh_configure_install() {
  process_start "Installing zsh"
  process_step "apt install zsh"
  sudo apt install zsh -y > /dev/null 2>&1
  [ $? -eq 0 ] && process_ok "Zsh successfully installed." || process_fail "Error installing zsh. Exit setup..."
}

zsh_configure_config() {
  process_start "Configuring zsh"
  process_step "Installing antibody"
  curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin > /dev/null 2>&1
  log_install_result "antibody"

  process_step "Installing starship"
  curl -sS https://starship.rs/install.sh | sudo sh -s -- --yes > /dev/null
  log_install_result "starship"
  
  process_step "Setting ZSH as the default Shell."
  sudo chsh -s $(which zsh) $(whoami)
  [ $? -eq 0 ] && process_step "Zsh set as the default Shell." || process_fail "Error setting zsh as the default shell."

  process_step "Copying .zshrc"
  cp "${ZSH_DIR}/config/.zshrc" "${HOME}/.zshrc"
    
  process_step "Copying .zshenv"
  cp "${ZSH_DIR}/config/.zshenv" "${HOME}/.zshenv"

  process_step "Copying .zprofile"
  cp "${ZSH_DIR}/config/.zprofile" "${HOME}/.zprofile"

  process_step "Copying .zsh config folder"
  cp -r "${ZSH_DIR}/config/.zsh" "${HOME}"

  process_ok "Zsh successfully configured."
}

zsh_remove_all() {
  zsh_remove_config

  process_start "Removing zsh"
  process_step "apt remove zsh"
  sudo apt remove zsh -y > /dev/null 2>&1
  [ $? -eq 0 ] && process_ok "Zsh successfully removed." || process_fail "Error removing zsh. Exit setup..."
}

zsh_remove_config() {
  process_start "Removing zsh config"

  process_step "Setting Bash as the default Shell."
  sudo chsh -s /bin/bash "$(whoami)"
  [ $? -eq 0 ] && process_step "Bash set as the default Shell." || process_fail "Error setting bash as the default shell."
  echo ""

  process_step "Removing starship"
  sh -c 'sudo rm "$(command -v 'starship')"'
  [ $? -eq 0 ] && process_step "starship successfully removed." || process_fail "Error removing starship. Exit setup..."

  process_step "Removing .zshrc"
  sudo rm "${HOME}/.zshrc"
    
  process_step "Removing .zshenv"
  sudo rm "${HOME}/.zshenv"

  process_step "Removing .zprofile"
  sudo rm "${HOME}/.zprofile"

  process_step "Removing .zsh config folder"
  sudo rm -r "${HOME}/.zsh"

  process_ok "Zsh configuration succesfully removed."
}

zsh_diff_all() {
  process_start "Zsh Diff"
  RESULT=0

  diff -r -q "${ZSH_DIR}/config/.zsh" "${HOME}/.zsh" || RESULT=1
  diff -r -q "${ZSH_DIR}/config/.zprofile" "${HOME}/.zprofile" || RESULT=1
  diff -r -q "${ZSH_DIR}/config/.zshenv" "${HOME}/.zshenv" || RESULT=1
  diff -r -q "${ZSH_DIR}/config/.zshrc" "${HOME}/.zshrc" || RESULT=1


  if [ "$RESULT" -eq 1 ]; then
    process_warn "ZSH: There are differences between the repository and the installed files."
  else 
    process_ok "All files are up to date."
  fi
}