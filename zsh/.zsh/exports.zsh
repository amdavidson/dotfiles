
# Set PATH
export PATH=~/bin:~/.local/bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Setup terminal environment
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

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
