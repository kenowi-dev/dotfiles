#!/usr/bin/env bash

log_install_result() {
  if [ $? -eq 0 ]; then
      process_step "$1 installed"
  else
      process_fail "Error installing $1. Exit setup..."
  fi
}

log_remove_result() {
  if [ $? -eq 0 ]; then
      process_step "$1 removed"
  else
      process_fail "Error removing $1. Exit setup..."
  fi
}

asdf_configure_all() {
  # dotfiles configure asdf
  asdf_configure_install
  asdf_configure_config
}

asdf_configure_install() {
  # dotfiles configure asdf --install-only
  process_start "Installing asdf"
  process_step "cloneing asdf repo"  
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1 > /dev/null 2>&1
  process_step "initializing asdf"
  . $HOME/.asdf/asdf.sh
  [ $? -eq 0 ] && process_ok "asdf successfully installed." || process_fail "Error installing asdf. Exit setup..."
}

asdf_configure_config() {
  # dotfiles configure asdf --config-only
  process_start "Configuring asdf"


  process_step "Installing Java openjdk 18"
    asdf plugin-add java https://github.com/halcyon/asdf-java.git > /dev/null 2>&1
    asdf install java openjdk-18
    asdf global java openjdk-18 > /dev/null 2>&1
  log_install_result "java openjdk 18"


  process_step "Installing Nodejs latest"
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git > /dev/null 2>&1
    asdf install nodejs latest
    asdf global nodejs latest > /dev/null 2>&1
  log_install_result "nodejs latest"

  process_ok "asdf successfully configured"
}

asdf_remove_all() {
  # dotfiles remove asdf
  asdf_remove_config

  process_start "Removing asdf"
    rm -rf "${ASDF_DATA_DIR:-$HOME/.asdf}" > /dev/null 2>&1
    rm -rf "$HOME/.tool-versions" "$HOME/.asdfrc" > /dev/null 2>&1
  process_ok "asdf successfully removed"
}

asdf_remove_config() {  
  # dotfiles remove asdf --config-only
  process_start "Removing asdf config"

  process_step "Removing Java"
    asdf plugin remove java > /dev/null 2>&1
  log_remove_result "java"

  process_step "Removing Java nodejs"
    asdf plugin remove nodejs > /dev/null 2>&1
  log_remove_result "java nodejs"

  process_ok "asdf configuration successfully removed"
}

asdf_diff_all() {
  # dotfiles diff asdf
  process_error "Not yet implemented. (asdf)"
}