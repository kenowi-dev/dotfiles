#!/usr/bin/env bash

declare ZSH_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

error() { printf "$(tput setaf 1)$1$(tput sgr0)\n"; }
success () { printf "$(tput setaf 2)$1$(tput sgr0)\n"; }
warn () { printf "$(tput setaf 3)$1$(tput sgr0)\n"; }
note() { printf "$(tput setaf 4)$1$(tput sgr0)\n"; }
info() { printf "$(tput setaf 5)$1$(tput sgr0)\n"; }

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
exit