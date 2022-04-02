# Environment Variables & Global Options

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=10000                  #How many lines of history to keep in memory
HISTFILE=~/.zsh_history         #Where to save history to disk
SAVEHIST=10000                  #Number of history entries to save to disk
HISTDUP=erase                   #Erase duplicates in the history file

setopt      appendhistory       #Append history to the history file (no overwriting)
setopt      extendedhistory     #Save each command's beginning timestamp and the duration to the history file
setopt      sharehistory        #Share history across terminals
setopt      incappendhistory    #Immediately append to the history file, not just when a term is killed
setopt      histignorealldups   #Remove duplicates from history
setopt      histreduceblanks    #Remove superflous blanks from history

setopt      prompt_subst        # allow expansion in prompts
setopt      nonomatch           # try to avoid the 'zsh: no matches found...'
setopt      hash_list_all       # whenever a command completion is attempted, make sure the entire command path is hashed first.
setopt      completeinword      # not just at the end
setopt      noshwordsplit       # use zsh style word splitting
setopt      auto_menu           # show completion menu on successive tab press
unsetopt    menu_complete       # Do not autoselect the first completion entry
setopt      always_to_end       # Insert autocompletion if the cursur is in the word.
setopt      completealiases     # Completes aliases.


setopt      noflowcontrol       # no c-s/c-q output freezing
setopt      longlistjobs        # display PID when suspending processes as well
setopt      notify              # report the status of backgrounds jobs immediately
setopt      interactivecomments # allow use of comments in interactive code

setopt      csh_null_glob
setopt      hist_verify
setopt      auto_cd
setopt      multios

#setopt      nobeep              # No "Beep"ing
setopt      pushd_ignore_dups   # Don't push the same dir twice 


export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
if [[ $SSH_CONNECTION ]]; then
    export EDITOR='nano'
elif [[ "$(uname -s)" == 'Linux' ]]; then
    export EDITOR='nano'
    export BROWSER='google-chrome'
else
    export EDITOR='nano'
    export BROWSER='google-chrome'
fi
