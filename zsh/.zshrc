if [[ $TERM = 'dumb' ]]; then
    export PS1='dumbterm> '
else
    source ~/.zsh/checks.zsh
    source ~/.zsh/colors.zsh
    source ~/.zsh/options.zsh
    source ~/.zsh/exports.zsh
    source ~/.zsh/prompt.zsh
    source ~/.zsh/completion.zsh
    source ~/.zsh/aliases.zsh
    source ~/.zsh/bindkeys.zsh
    source ~/.zsh/functions.zsh
    source ~/.zsh/hooks.zsh
fi

# if FZF is installed, source it.
if [ -e ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

if [ -e ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
