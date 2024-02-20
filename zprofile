# homebrew - https://brew.sh/
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf - https://asdf-vm.com/
. "$HOME/.asdf/asdf.sh"

# Google Cloud SDK path and completion
if [ -f '/Users/will.bolton/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/will.bolton/bin/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/will.bolton/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/will.bolton/bin/google-cloud-sdk/completion.zsh.inc'; fi

# environment variables
export EDITOR=vim
export GPG_TTY="$(tty)"
export ZSH_COMPDUMP=/Users/will/.cache/.zcompdump

# add ~/bin and python to PATH
export PATH="/Users/will.bolton/bin:/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"

# TODO: PS1 inc. git branch in PS1 when in git repository

# aliases
alias grep='grep --color=auto --binary-files=without-match'
alias py='python3'
alias tf='terraform'
alias tg='terragrunt'
