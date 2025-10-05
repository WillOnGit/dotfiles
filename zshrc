# homebrew - https://brew.sh/
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf - https://asdf-vm.com/
. "$HOME/.asdf/asdf.sh"

# Google Cloud SDK path and completion
if [ -f '/Users/will.bolton/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/will.bolton/bin/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/will.bolton/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/will.bolton/bin/google-cloud-sdk/completion.zsh.inc'; fi

# environment variables
# unbelievably EDITOR=vim breaks zsh bindkey mappings on macOS... not worth figuring out how to unbreak them.
#export EDITOR=vim
export GPG_TTY="$(tty)"
export XDG_CONFIG_HOME="$HOME/.config"
export LESS="-i"
# macOS specific
SHELL_SESSIONS_DISABLE=1

# add ~/bin and python to PATH
export PATH="/opt/homebrew/opt/postgresql@13/bin:/Users/will.bolton/bin:/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"

# PS1 customisation and vcs_info setup
# man zshall: vcs_info, EXPANSION OF PROMPT SEQUENCES, CHARACTER HIGHLIGHTING
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
		   '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
		   '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }
setopt PROMPT_SUBST
PS1='%F{3}%3~ ${vcs_info_msg_0_}%f%# '

# some useful shell options
setopt autocd
#setopt cdablevars
#setopt extendedglob
#setopt globdots

# aliases
alias grep='grep --color=auto --binary-files=without-match --exclude-dir .git --exclude-dir node_modules --exclude-dir .terragrunt-cache'
alias py='python3'
alias t='tmux'
alias ta='tmux attach'
alias tf='terraform'
alias tg='terragrunt'
