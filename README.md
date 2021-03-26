# System Config
---------------
This project serves the purpose to setup and configure a fresh system but can be configured to just tweak an already set up one as well.
This process is done using [Ansible](https://www.ansible.com/). 

## <span style="color:red"> **Warning** </span>
----------------
Running the installation blindly may break your current configurations.
Read the [Configuration](#Configuration) section for detailed information about the individal tasks.


## Installation
--------------
### Bootstrap
--------------
**Warning:** The `bootstrap.sh` will `update/upgrade` **all** of your current packages. If you dont want that please refer to the [manual installation](#Manual-Installation).

For an easy and complete installation run the `bootstrap.sh`.
This will install ansible and start the `ansible-playbook`. 

**Be ware:** running `bootstrap.sh` without any arguments may break your current configurations, since it may overwrite already existing configurations. Go to [Configuration](#Configuration) for further information on the tasks' behaviours.

### Manual Installation
-------------
If the `bootstrap.sh` fails or you want to manually run the `ansible-playbook`, follow these steps.
  1. Install Ansible: [Official installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-specific-operating-systems)
  2. Configure your installation: [Configuration](#Configuration)
  3. Run the installation with your desired configuration: `ansible-playbook setup.yml --tags "..." --skip-tags "..."`


## Configuration
-----------------
To only run certain tasks use the `--tags` parameter with a list of task that you wish to run:`--tags "your,tag,list"`

To skip certain task you can use the `--skip-tags` parameter with a list of task that you wish to skip_ `--skip-tags "tasks,to,skip"`. 

**Important:** Some roles are dependent on others. So when you skip a role, it may still be installed via a dependency from a different role.

A list of tasks is a string with the tasks' names seperated by a comma: Example `"vscode,zsh,git,java"`

## Tasks
----------------

### Overview
----------------

*This is a list of the already implemeted tasks, as well as the currently planned task for the future. This list will change over time.*

- [x] [vscode](#vscode)
- [x] [dotfiles_vscode](#dotfiles_vscode)
- [x] [zsh](#zsh)
- [x] [dotfiles_zsh](#dotfiles_zsh)
- [x] [elixir](#elixir)
- [x] [erlang](#erlang)
- [ ] [gaming](#gaming)
- [x] [git](#git)
- [x] [java](#java)
- [x] [packages](#packages)
- [x] [python](#python)
- [x] [snaps](#snaps)
- [x] [spotify](#spotify)
- [x] [spicetify](#spicetify)
- [ ] [uni](#uni)

I try to make all tasks compatible with Ubuntu and Fedora.

## vscode
--------------
The [vscode task](#vscode) is only responsible for installing [vscode](https://code.visualstudio.com/).
Currently this is done using `snap`. In the future this may change or will become configurable, since [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) does not support `snaps` (yet).


## dotfiles_vscode
--------------
This task configures [vscode](https://code.visualstudio.com/) with my settings, extensions and themes. For further information please refer to my [vscode settings repo](https://github.com/systeno/vscode-settings).


## zsh
--------------
This task is only responsible to install `zsh`.


## dotfiles_zsh
--------------
This task configures `zsh` with [my dotfiles](https://github.com/systeno/dotfiles).  

As a Shell Plugin Manager I am using [Antibody](https://getantibody.github.io/). 

This configuration will also install a [Powerlevel Theme](https://github.com/romkatv/powerlevel10k) and some other plugins.

The [Powerlevel Theme](https://github.com/romkatv/powerlevel10k) needs [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) to work properly. Currently these will **not** be installed automatically. 

My Themes and shell design is created, while having a [Nord Theme](https://www.nordtheme.com/) active on my terminal.


## elixir
--------------
This task installs [elixir](https://elixir-lang.org/).
This task is dependent on the [erlang](#erlang) task.

## erlang
--------------
This task installs [erlang](https://www.erlang.org/).

## gaming
--------------
This task is not yet implemeted.

The idea is to create a task which will install all necessary tools needed to play games.
This may include programms like:
- [ ] Steam
- [ ] Discord
- [ ] Teamspeak

## git
--------------
This task is responsible to install and configure [git](https://git-scm.com/). 

This task will also set a `gitconfig` file. To configure the contens of the file, edit the appropriate settings in `group_vars/local.yml`.


## java
--------------
This task is responsible to install `java`.
For now the latest java version will be installed. In the future this should be configurable.


## packages
--------------
This task installs some usefull packages based on the distro used.

The pacakges installed can be found at `roles/packages/defaults/main.yml`. 


## python
--------------
This task is responsible to install `python2` and `python3`.

## snaps
--------------
This task installs some usefull snap packages.

The pacakges installed can be found at `roles/snaps/defaults/main.yml`. 

## spotify
--------------
This task installs [Spotify](https://www.spotify.com/us/). 
The installation is done via [Flatpak](https://flatpak.org/).
[Flatpak](https://flatpak.org/) is used, to make spotify work with [spicetify](#spicetify).

## spicetify
--------------
This task installs [Spicetify](https://github.com/khanhas/spicetify-cli). 
It will also install all themes available at [spicetify-themes](https://github.com/morpheusthewhite/spicetify-themes) and set the [Nord Theme](https://github.com/morpheusthewhite/spicetify-themes/tree/master/Nord) as the active one.

## uni
--------------
This task is not yet implemeted. 

The idea is to create a task which installs all necessary tool, that I need for my University.

This may include programms like:
- [ ] MS Teams
- [ ] Zoom
