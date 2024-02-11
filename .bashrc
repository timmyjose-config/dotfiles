# set default terminal type
TERM="xterm-256color"
CLICOLOR=YES
PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
PROMPT_DIRTRIM=2

# git
#if [[ ! -n "$SSH_AUTH_SOCK" ]]
#then
#  eval `ssh-agent -s`
#  ssh-add ~/.ssh/m3pro
#fi

SSH_AGENT_SOCKET=~/.ssh/ssh-agent.sock
export SSH_AUTH_SOCK=$SSH_AGENT_SOCKET

if [ ! -S "$SSH_AUTH_SOCK" ]; then
    rm -f "$SSH_AGENT_SOCKET"
    eval $(ssh-agent -s -a "$SSH_AGENT_SOCKET")
    ssh-add ~/.ssh/m3pro
else
    if ! ssh-add -l > /dev/null 2>&1; then
        rm -f "$SSH_AGENT_SOCKET"
        eval $(ssh-agent -s -a "$SSH_AGENT_SOCKET")
        ssh-add ~/.ssh/m3pro
    fi
fi

# aliases
alias git="LANG=\"en_US.UTF-8\" git"
alias tmux='tmux -2'
alias py=python3
alias python=python3
alias pip=pip3
alias htop="htop --no-colour"
alias jshell="jshell --enable-preview"
alias miri="MIRIFLAGS=-Zmiri-tag-raw-pointers cargo miri"
alias ocaml="ledit ocaml"

# create and change into directory
function ccd {
  if [ -d "$1" ]
  then
      echo "Directory $1 already exists"
  else
    mkdir -p "$1" && cd "$1"
  fi
}

export GPG_TTY=$(tty)

# disable homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(direnv hook bash)"

[ -f "/Users/timmyjose/.ghcup/env" ] && source "/Users/timmyjose/.ghcup/env" # ghcup-env
