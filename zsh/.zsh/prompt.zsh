#setopt promptsubst
autoload -U colors && colors # Enable colors in prompt

function git_prompt {
    local FULL_BRANCH="$(git symbolic-ref -q HEAD 2>/dev/null || git name-rev --name-only --no-undefined --always HEAD 2>/dev/null)"
    PBRANCH="$(echo $FULL_BRANCH | sed 's/refs\/heads\///')"
    if [ -n $PBRANCH ]; then
        echo -n " ${PBRANCH} "
        # Are there unstaged changes in the working directory
        local CHANGED=$(git status --porcelain --ignore-submodule -unormal 2>/dev/null | wc -l)
        if [ $CHANGED -gt 0 ]; then
            PCHANGED="◊"
        fi
        # Are we behind the origin?
        local NUM_BEHIND="$(git log --oneline ..@{u} 2>/dev/null | wc -l | tr -d ' ' )"
        if [ "$NUM_BEHIND" -gt 0 ]; then
            PBEHIND="↓"
        fi
        # Are we ahead of the origin?
        local NUM_AHEAD="$(git log --oneline @{u}.. 2>/dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_AHEAD" -gt 0 ]; then
            PAHEAD="↑" 
        fi

        if [[ -n $PCHANGED || -n $PAHEAD || -n $PBEHIND ]]; then
            echo -n "${PCHANGED}${PBEHIND}${PAHEAD} "
        fi
    fi
}

# Truncate working directory
function truncated_pwd() {
    n=$1
    path=`current_pwd`

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

function current_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function check_reboot {
    test -f /var/run/reboot-required && echo "R "
}

PROMPT='${PR_BOLD_RED}$(check_reboot)%{$reset_color%}%m ${PR_BOLD_YELLOW}$(truncated_pwd 3)$(git_prompt)%(?.%F{magenta}.%F{red})❯%f %{$reset_color%}%'
#PROMPT='$(check_reboot)%m $(truncated_pwd 3) $(git_branch) $(git_unstaged)$(git_is_ahead)$(git_is_behind)> '
