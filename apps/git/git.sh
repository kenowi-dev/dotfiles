#!/usr/bin/env bash

git_configure_all() {
  # dotfiles install git
  git_configure_install
  git_configure_config

  process_error "Not yet implemented. (git)"
}

git_configure_install() {
  # dotfiles install git --install-only
  process_error "Not yet implemented. (git)"
}

git_configure_config() {
  # dotfiles install git --config-only
  process_error "Not yet implemented. (git)"
}

git_remove_all() {
  # dotfiles remove git
  git_remove_config  
  process_error "Not yet implemented. (git)"
}

git_remove_config() {
  # dotfiles remove git --config-only
  process_error "Not yet implemented. (git)"
}

git_diff_all() {
  # dotfiles diff git
  process_error "Not yet implemented. (git)"
}