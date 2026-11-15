#!/usr/bin/env zsh
##############################################################################
# ZSH History Configuration
##############################################################################


HISTSIZE=5000                           # How many lines of history to keep in memory
HISTFILE="$XDG_STATE_HOME/zsh/history"  # Where to save history to disk
SAVEHIST=5000                           # Number of history entries to save to disk
HISTDUP=erase                           # Erase duplicates in the history file

setopt    appendhistory                 # Append history to the history file (no overwriting)
setopt    extendedhistory               # Save each command's beginning timestamp and the duration to the history file
setopt    sharehistory                  # Share history across terminals

setopt    incappendhistory              # Immediately append to the history file, not just when a term is killed
setopt    histignorealldups             # Remove duplicates from history<
setopt    histreduceblanks              # Remove superflous blanks from history


setopt noflowcontrol                    # no c-s/c-q output freezing
setopt longlistjobs                     # display PID when suspending processes as well

setopt notify                           # report the status of backgrounds jobs immediately

setopt interactivecomments              # allow use of comments in interactive code

setopt csh_null_glob
setopt hist_verify
setopt auto_cd
setopt multios

setopt nobeep                           # No "Beep"ing
setopt pushd_ignore_dups                # Don't push the same dir twice