# Lazy
alias ..='cd ..'
alias lh='ls -d .*' # show hidden files/directories only
alias lsd='ls -aFhlG'
alias l='ls -al'
alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GFhl' # Same as above, but in long listing format

# List directories sorted by size
alias dus='du -sckx * | sort -nr'

# Refresh when settings have been updated
alias refresh='source ~/.zshrc'

# use nvim
alias vim='nvim'
alias vi='nvim'

# blank-chrome
function blank-chrome {
    if [ "$@" ]; then
        URL="$@"
    else 
        URL="https://duckduckgo.com"
    fi
    TMPDIR=`mktemp -d /tmp/chrome-XXXXX`
    if [ IS_MAC ]; then
        /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=$TMPDIR --no-first-run --no-make-default-browser "$URL"
    else
        google-chrome --user-data-dir=$TMPDIR --no-first-run --no-make-default-browser "$URL"
    fi
    rm -rf $TMPDIR
}
