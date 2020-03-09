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

# fix sudo autocorrections
alias sudo="nocorrect sudo"

# A crude speedtest with curl
alias speedtest="curl -o /dev/null http://speedtest-nyc1.digitalocean.com/100mb.test"

# blank-chrome
function blank-chrome {
    if [ "$@" ]; then
        URL="$@"
    else 
        URL="https://duckduckgo.com"
    fi
    TMPDIR=`mktemp -d /tmp/chrome-XXXXX`
    if [ $IS_MAC ]; then
        /Applications/Chromium.app/Contents/MacOS/Chromium --user-data-dir=$TMPDIR --no-first-run --no-make-default-browser "$URL"
    else
        chromium-browser --user-data-dir=$TMPDIR --no-first-run --no-make-default-browser "$URL"
    fi
    rm -rf $TMPDIR
}
