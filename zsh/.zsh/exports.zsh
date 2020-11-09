
# Set PATH
export PATH=~/bin:~/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Setup terminal environment
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Setup XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Enable grep colors
export GREP_COLOR='3;33'

# VIM everything
export EDITOR='nvim'

# Fix gnupg
export GPG_TTY=$(tty)

# Fix GOPATH
export GOPATH="$HOME/dev/go"
export PATH="$HOME/dev/go/bin:$PATH"

# tmux command for use with ssh / mosh commands
export TM="tmux new-session -A -s main"
