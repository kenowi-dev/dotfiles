#!/usr/bin/env bash

asdf_configure_all() {
  # dotfiles install asdf
  asdf_configure_install
  asdf_configure_config

  process_error "Not yet implemented. (asdf)"
}

asdf_configure_install() {
  # dotfiles install asdf --install-only
  process_error "Not yet implemented. (asdf)"
}

asdf_configure_config() {
  # dotfiles install asdf --config-only
  process_error "Not yet implemented. (asdf)"
}

asdf_remove_all() {
  # dotfiles remove asdf
  asdf_remove_config  
  process_error "Not yet implemented. (asdf)"
}

asdf_remove_config() {
  # dotfiles remove asdf --config-only
  process_error "Not yet implemented. (asdf)"
}

asdf_diff_all() {
  # dotfiles diff asdf
  process_error "Not yet implemented. (asdf)"
}