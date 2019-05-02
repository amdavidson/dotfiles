# Truncate working directory
function truncated_pwd() {
    n=$1
    path=`collapse_pwd`

    dirs=("${(s:/:)path}")
    dirs_length=$#dirs

    if [[ $dirs_length -ge $n ]]; then
        ((max=dirs_length - n))
        for (( i = 1; i <= $max; i++ )); do
            step="$dirs[$i]"
            if [[ -z $step ]]; then
                continue
            fi
            if [[ $stem =~ "^\." ]]; then
                dirs[$i]=$step[0,2]
            else
                dirs[$i]=$step[0,1]
            fi
        done
    fi
    echo ${(j:/:)dirs}
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
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



