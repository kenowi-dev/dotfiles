source ~/.zsh/completions
source ~/.zsh/aliases
source ~/.zsh/colors

fpath=(~/.zsh/functions $fpath)

autoload precmd
autoload clean-antibody

# Initialize Antibody
source <(antibody init)

# Plugins
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle ael-code/zsh-colored-man-pages
antibody bundle hcgraf/zsh-sudo 
antibody bundle supercrabtree/k 
antibody bundle agkozak/zsh-z

# Theme
eval "$(starship init zsh)"

source ~/.zsh/starship

<<<<<<< HEAD
=======
. $HOME/.asdf/asdf.sh 2> /dev/null
>>>>>>> 3bb6cb178f34290241f928cf84d62ebb377b8f09

if test -f "$HOME/.asdf/asdf.sh"; then
    . $HOME/.asdf/asdf.sh
fi

export PATH="$PATH:$HOME/.dotfiles/bin"

# Should be at the end of this file
antibody bundle zsh-users/zsh-syntax-highlighting
sleep 1
