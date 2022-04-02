#!/usr/bin/env bash
SYSTEM_DIR="${DOTFILES_APPS_DIR}/system"

system_configure_all() {
  system_configure_install
  echo ""
  system_configure_config
}

system_configure_install() {
  note "Nothing to install"
}

system_configure_config() {
  note "Configuring system"
  USER=$(whoami)
  sudo sed "s/username/$(whoami)/" "$SYSTEM_DIR/config/user" | sudo tee "/etc/sudoers.d/$USER" > /dev/null
  success "passwordless sudo configured successfully"
}

system_remove_all() {
  system_remove_config  
}

system_remove_config() {
  note "Remove system configurations"
  USER=$(whoami)
  sudo rm "/etc/sudoers.d/$USER"
  success "removed passwordless sudo"
}

system_diff_all() {
  warn "system diff not implemented yet"
}