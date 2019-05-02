# Dotfiles

These are generic dotfiles intended for use across any platform.

## Supported Configurations
* bash
* conky
* emacs
* git
* i3
* mutt
* offlineimap
* khard
* tmux
* vim
* zsh

## Installation

Following the best practices of the local platform install `git` and `stow`.

```
$ git clone ssh://git@gitlab.com/amdavidson/dotfiles.git $HOME/.dotfiles
$ cd $HOME/.dotfiles
$ ./update.sh
$ stow {scripts,bash,git,tmux,vim}
```

## Local Configuration
Locally specific `bash` or `zsh` configurations can be put into `$HOME/.$SHELL_local` and they will be applied as a superset of the main `.$SHELLrc` file.

### mutt

Using `mutt` requires that you also `stow` the helper scripts to get access to `pw.sh` and that you include `IMAP_USERNAME` and `IMAP_PASSWORD` in the .env file.

### khard / vdirsyncer

Using `khard` and `vdirsyncer` requires that you also `stow` the helper scripts to get access to `pw.sh` and that you include `CARDDAV_USERNAME` and `CARDDAV_PASSWORD` in the .env file.
