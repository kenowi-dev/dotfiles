#!/usr/bin/env bash

test_configure_all() {
  test_configure_install
  test_configure_config
}

test_configure_install() {
  process_start "Configuring test"
  process_step "test step 1"
  process_step "test step 2"
  process_step "test step 3"
  process_step "test step 4"
  process_ok "Test configured"
}

test_configure_config() {
  process_start "Configuring test"
  process_step "test step 1"
  process_warn "test warn 1"
  process_step "test step 2"
  process_step "test step 4"
  process_error "Test configured"
}

test_remove_all() {
  test_remove_config  

  fail "fail hard"
}

test_remove_config() {
  note "basic note"
  note "basic note 2"
}

test_diff_all() {
  process_start "Test diff"
  process_step "diff step 1"
  process_fail "something went wrong."
}