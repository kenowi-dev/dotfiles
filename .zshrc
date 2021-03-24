#################
# Shell Options #
#################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


source ~/.zsh/completions
source ~/.zsh/aliases
source ~/.zsh/colors
source ~/.zsh/inputrczsh
fpath=(~/.zsh/functions $fpath)

autoload clean-antibody

# Initialize Antibody
source <(antibody init)

# Common Plugins
antibody bundle chrissicool/zsh-256color
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle ael-code/zsh-colored-man-pages
antibody bundle hcgraf/zsh-sudo
antibody bundle supercrabtree/k
antibody bundle agkozak/zsh-z

source ~/.zsh/p10k.zsh
antibody bundle romkatv/powerlevel10k

# To customize prompt, run `p10k configure`. Remember that this will put the p10k.zsh in ~/.p10k.zsh and not in ~/.zsh/p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

# Should be at the end of this file
antibody bundle zsh-users/zsh-syntax-highlighting
sleep 1


