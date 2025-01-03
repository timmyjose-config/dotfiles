# set default terminal type
TERM="xterm-256color"
CLICOLOR=YES
PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
PROMPT_DIRTRIM=2

SSH_AGENT_SOCKET=~/.ssh/ssh-agent.sock
export SSH_AUTH_SOCK=$SSH_AGENT_SOCKET

if [ ! -S "$SSH_AUTH_SOCK" ]; then
    rm -f "$SSH_AGENT_SOCKET"
    eval $(ssh-agent -s -a "$SSH_AGENT_SOCKET")
    ssh-add ~/.ssh/id_rsa
else
    if ! ssh-add -l > /dev/null 2>&1; then
        rm -f "$SSH_AGENT_SOCKET"
        eval $(ssh-agent -s -a "$SSH_AGENT_SOCKET")
        ssh-add ~/.ssh/id_rsa
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
alias x="x.sh"
alias wr="wr.sh"
alias rr="evcxr"

# create and change into directory
function ccd {
  if [ -d "$1" ]
  then
      echo "Directory $1 already exists"
  else
    mkdir -p "$1" && cd "$1"
  fi
}

# go to the nearest enclosing git directory
function crd {
  cd ..
  while [[ ! -d ".git" && $(pwd) != "/" ]]; do
    cd ..
  done
}

# diff JSON files semanticslly
function jd {
  if [[ ! -f "$1" ]]; then
    echo "$1 does not exist"
    return 1
  fi

  if [[ ! -f "$2" ]]; then
    echo "$2 does not exist"
    return 1
  fi

  diff <(jq --sort-keys . "$1") <(jq --sort-keys . "$2")
}

# disable homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export GPG_TTY=$(tty)
[ -f "/Users/timmyjose/.ghcup/env" ] && . "/Users/timmyjose/.ghcup/env" # ghcup-env

eval "$(direnv hook bash)"

export REACT_EDITOR=vim
