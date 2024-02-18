PROMPT_COMMAND='history -a'

alias boomi='ssh adm.joshhend@boomi1.byu.edu -p 22222'
alias iics='ssh adm.joshhend@hera.byu.edu -p 22222'

alias cdcode='cd /c/code'

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

PS1="\n\t \[\e[32m\]\w\[\e[34m\]\$(virtualenv_info)\[\e[33m\]\$(__git_ps1)\[\e[0m\]
$ "
