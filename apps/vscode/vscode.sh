#!/usr/bin/env bash

vscode_configure_all() {
  # dotfiles install vscode
  vscode_configure_install
  vscode_configure_config

  process_error "Not yet implemented. (vscode)"
}

vscode_configure_install() {
  # dotfiles install vscode --install-only
  process_error "Not yet implemented. (vscode)"
}

vscode_configure_config() {
  # dotfiles install vscode --config-only
  process_error "Not yet implemented. (vscode)"
}

vscode_remove_all() {
  # dotfiles remove vscode
  vscode_remove_config  
  process_error "Not yet implemented. (vscode)"
}

vscode_remove_config() {
  # dotfiles remove vscode --config-only
  process_error "Not yet implemented. (vscode)"
}

vscode_diff_all() {
  # dotfiles diff vscode
  process_error "Not yet implemented. (vscode)"
}