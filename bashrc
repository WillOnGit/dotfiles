# set environment variables
export EDITOR=vim
export PATH=~/bin:$PATH
# disable autocompletion of remote branches in git checkout
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1

# setup aliases
alias grep='grep --color=auto --binary-files=without-match'
alias kc='kubectl'
alias py='python'
alias yf='xclip -r -selection Clipboard'

# autocompletion
. /usr/share/bash-completion/completions/docker
. /usr/share/bash-completion/completions/eselect
. /usr/share/bash-completion/completions/git
. /usr/share/bash-completion/completions/pass

# git info in PS1 when in git repository
. /usr/share/git/git-prompt.sh
PS1='\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \[\033[01;33m\]$(__git_ps1 "(%s) ")\[\033[01;34m\]\$\[\033[00m\] '
