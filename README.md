# System Config

This project installs my commonly used packages/apps and configures them using [ansible](https://www.ansible.com/).

## Installation

 1. Install ansible
 2. Clone this repo anywhere you like
 3. Run the via `ansible-playbook setup.yml`

## Configure

To run only run certain configurations run ansible with `--tags "tag1,tag2,..."` and/or `--skip-tags "tag1,tag2,..."`. 

**Important:** Some roles are dependent on others. So when you skip a role, it may still be installed via a dependency from a different role.

The tags available have the same name as their roles.

## Roles 

Not all roles are implemented yet. And more roles may be added in the future.

- [x] asdf
- [x] vscode
- [x] dotflies_vscode
- [ ] zsh
- [ ] dotfiles_zsh
- [x] elixir
- [x] erlang
- [ ] gaming
- [x] git
- [x] java
- [x] packages
- [x] python
- [ ] snaps
- [ ] spotify
- [ ] spicetify
- [ ] uni