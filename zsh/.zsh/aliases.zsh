if [[ "$OSTYPE" == "darwin"* ]]; then 
    alias ..='cd ..'
    alias lh='ls -d .*' # show hidden files/directories only
    alias lsd='ls -aFhlG '
    alias l='ls -al '
    alias ll='ls -GFhl ' # Same as above, but in long listing format
else
    alias ..='cd ..'
    alias lh='ls --color=auto -d .*' # show hidden files/directories only
    alias lsd='ls --color=auto -aFhlG '
    alias l='ls --color=auto -al '
    alias ll='ls --color=auto -GFhl ' # Same as above, but in long listing format
fi

# Refresh when settings have been updated
alias refresh='source ~/.zshrc'

# use nvim
alias vim='nvim'
alias vi='nvim'
alias nv='nvim'

# remote access
alias mroyal='mosh royal -- tmux new-session -A -s main'
alias mari='mosh ari -- tmux new-session -A -s main'
alias mchas='mosh chas -- tmux new-session -A -s main'
alias muzi='mosh uzi -- tmux new-session -A -s main'
alias mnf='mosh amdavidson@needleandfoot.com -- tmux new-session -A -s main'

# fix sudo autocorrections
alias sudo="nocorrect sudo"

# shortcut for tmux command
alias tm="tmux new-session -A -s main"

# A crude speedtest with curl
alias speedtest="curl -o /dev/null http://speedtest-nyc1.digitalocean.com/100mb.test"

