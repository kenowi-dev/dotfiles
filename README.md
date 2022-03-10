# dotfiles

This is a repo with my dotfiles.
Currently there are only zsh dotfiles. This will most likely change in the future.

## Installation

Currently there is no installation script. 
All dotfiles have to be moved manually. It is recommended to place them all in your home directory.

### Dependencies
- `zsh`     : `sudo apt install zsh`
- `antibody`: `curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin`
- `starship`: `curl -sS https://starship.rs/install.sh | sh`

To set `zsh` as your default shell, use `chsh -s $(which zsh)` (**No** `sudo`, so it will be set for the current user). 

### Fonts

For the `starship` theme to work properly, you need to install a [Nerd Font](https://www.nerdfonts.com/font-downloads), e.g. `JetBrainsMono Nerd Font`.
