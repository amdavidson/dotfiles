# checks (stolen from zshuery)
if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

if [[ -x `which brew >/dev/null 2>&1` ]]; then
    HAS_BREW=1
fi

if [[ -x `which apt-get >/dev/null 2>&1` ]]; then
    HAS_APT=1
fi

if [[ -x `which yum >/dev/null 2>&1` ]]; then
    HAS_YUM=1
fi
