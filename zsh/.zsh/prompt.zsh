#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

# Show Git branch/tag, or name-rev if on detached head
function git_branch {
    local FULL_BRANCH="$(git symbolic-ref -q HEAD 2>/dev/null || git name-rev --name-only --no-undefined --always HEAD 2>/dev/null)"
    local SHORT_BRANCH="$(echo $FULL_BRANCH | sed 's/refs\/heads\///')"
    echo " %F{blue}$SHORT_BRANCH%f"
}

function git_is_ahead {
    local NUM_AHEAD="$(git log --oneline @{u}.. 2>/dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_AHEAD" -gt 0 ]; then
       echo " %F{red}↑%f" 
    fi
}

function git_is_behind {
    local NUM_BEHIND="$(git log --oneline ..@{u} 2>/dev/null | wc -l | tr -d ' ' )"
    if [ "$NUM_BEHIND" -gt 0 ]; then
        echo " %F{blue}↓%f"
    fi
}

function git_unstaged {
    local CHANGED=$(git status --porcelain --ignore-submodule -unormal 2>/dev/null | wc -l)
    if [ $CHANGED -gt 0 ]; then
        echo -e "%F{yellow}~%f\c"
    fi
}

function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

PROMPT='${PR_BOLD_YELLOW}$(truncated_pwd 3)$(git_branch)%{$reset_color%}$(git_unstaged)$(git_is_ahead)$(git_is_behind) %(?.%F{magenta}.%F{red})❯%f '
