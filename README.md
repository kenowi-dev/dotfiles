# dotfiles

This repo installs and configures some of my programms.

## Installation

Running `curl -s https://raw.githubusercontent.com/systeno/dotfiles/main/bootsrap | sh` will install this repository to `~/.dotfiles`.
Alternatively you can clone is repo manually.

## Running

To run the setup use the `bin/dotfiles` script.
- `bin/dotfiles install --all` -- Install and configure everything
- `bin/dotfiles remove --all` -- Remove all configurations and apps.
- `bin/dotfiles --help` -- Show usage

## **Important**

The `.zshrc` installed in the zsh task, will set `export PATH="$PATH:$HOME/.dotfiles/bin"`, for easier use of the `dotfiles` manager.
If you changed the install location, remember to change this path too.

## Supported Apps

| app    | Install command | remove command | diff command |
|--------|-----------------|----------------|--------------|
| asdf   | [ ]             | [ ]            | [ ]          |
| git    | [ ]             | [ ]            | [ ]          |
| system | [ ]             | [ ]            | [ ]          |
| vscode | [ ]             | [ ]            | [ ]          |
| zsh    | [ ]             | [ ]            | [ ]          |

## Dependencies

For the `starship` theme to work properly, you need to install a [Nerd Font](https://www.nerdfonts.com/font-downloads), e.g. `JetBrainsMono Nerd Font`.
