
# Show what requires a reboot if one is required
reboot_for() {
    if test -f /var/run/reboot-required; then
        echo "Reboot required for:"
        cat /var/run/reboot-required.pkgs
    else
        echo "Nothing requires a reboot."
    fi
}

# Extract anything
extract() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}


# create an archive of a list of files, compress the archive, and encrypt the compressed archive 
function archive-and-encrypt {
    echo -n "Enter desired output filename: "
    read filename
    tar cJ $1 | \
    gpg -q -r andrew@amdavidson.com -s -e -o "$filename.tar.xz.gpg"
}

# run mosh and tmux to a specific host
function mt {
    mosh $1 -- tmux new-session -A -s main
}

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

