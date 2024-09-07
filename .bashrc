export HISTCONTROL=ignoreboth

alias cdcode='cd /c/code'
alias gs='git status'

export VISUAL=nvim
export EDITOR="$VISUAL"

export GIT_EDITOR="$EDITOR"

function virtualenv_info() {
    if test -z "$VIRTUAL_ENV" ; then
        PYTHON_VIRTUALENV=""
    else
        PYTHON_VIRTUALENV=" [`basename \"$VIRTUAL_ENV\"`]"
    fi
    [[ -n "$PYTHON_VIRTUALENV" ]] && echo "$PYTHON_VIRTUALENV"
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"

PS1="\n\[\e[31m\]\u\[\e[35m\]@\[\e[31m\]\h \[\e[32m\]\w\[\e[34m\]\$(virtualenv_info)\[\e[33m\]\$(__git_ps1)\[\e[0m\]
$ "
