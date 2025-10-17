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
export LESS="-iR"

# add ~/bin and python to PATH
export PATH="$HOME/.deno/bin:$HOME/.cargo/bin:/opt/homebrew/opt/postgresql@13/bin:/Users/will.bolton/bin:/Users/will.bolton/.local/bin:/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"

# PS1 customisation and vcs_info setup
# man zshall: vcs_info, EXPANSION OF PROMPT SEQUENCES, CHARACTER HIGHLIGHTING
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
		   '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
		   '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git # don't bother using anything other than git
precmd () { vcs_info }
setopt PROMPT_SUBST

PS1='%F{3}%3~ ${vcs_info_msg_0_}%f%# '
#PS1='%F{3}%3d ${vcs_info_msg_0_}%f%# '
# ORIGINAL# zstyle ':completion:*:*:git:*' script /opt/homebrew/Cellar/git/2.47.0/share/zsh/site-functions/git-completion.bash
brew_git_version=$(ls -1 /opt/homebrew/Cellar/git | sort -n | tail -n 1)
zstyle ':completion:*:*:git:*' script /opt/homebrew/Cellar/git/$brew_git_version/share/zsh/site-functions/git-completion.bash

# some useful shell options
setopt autocd
setopt extendedglob
#setopt cdablevars
#setopt globdots

# aliases
alias ef='find . -type d -name node_modules -prune -o'
alias grep='grep --color=auto --binary-files=without-match --exclude-dir .git --exclude-dir node_modules --exclude-dir .terragrunt-cache --directories=skip'
alias kc='kubectl'
alias pip='pip3'
alias pnode='NODE_REPL_HISTORY=/dev/null node'
alias ppy='PYTHON_HISTORY=/dev/null python3'
alias py='python3'
alias sed='sed -EH'
alias sshh='LC_ALL=C TERM=xterm-256color ssh'
alias t='tmux'
alias ta='tmux attach'
alias tf='terraform'
alias tg='terragrunt'
alias treeg='tree --gitignore'
alias v='vim'

autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/will.bolton/.asdf/installs/terraform/1.8.2/bin/terraform terraform
complete -C '/usr/local/bin/aws_completer' aws # AWS CLI autocompletion - https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html

gitroot () {
	local ORIGINAL_DIR="$(pwd)"
	local RESULT="$(while [ "$(pwd)" != "/" ]; do
		TEST_DIR="$(pwd)"
		if [ -d "$TEST_DIR"/.git ]; then
			echo "$TEST_DIR";
			break
		fi
		cd ..
	done)"

	if [ -z "$RESULT" ]; then
		echo "Fatal: $ORIGINAL_DIR is not inside a git repository";
	else
		cd "$RESULT"
	fi
}
