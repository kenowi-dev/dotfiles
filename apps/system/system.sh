#!/usr/bin/env bash
SYSTEM_DIR="${DOTFILES_APPS_DIR}/system"

system_configure_all() {
  system_configure_install
  system_configure_config
}

system_configure_install() {
  process_ok "Nothing to install"
}

system_configure_config() {
  process_start "Configuring system"
  USER=$(whoami)
  process_step "Setting passwordless sudo"
  sudo sed "s/username/$(whoami)/" "$SYSTEM_DIR/config/user" | sudo tee "/etc/sudoers.d/$USER" > /dev/null
  process_ok "passwordless sudo configured"
  process_ok "System configured"
}

system_remove_all() {
  system_remove_config  
}

system_remove_config() {
  process_start "Remove system configurations"
  process_step "removeing passwordless sudo"
  USER=$(whoami)
  sudo rm "/etc/sudoers.d/$USER"
  process_step "removed passwordless sudo"
  process_ok "Removed system configurations"
}

system_diff_all() {
  process_error "system diff not implemented yet"
}