# set default terminal type
TERM="xterm-256color"
CLICOLOR=YES
PS1="\w\$ "
PROMPT_DIRTRIM=2

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# aliases
alias git="LANG=\"en_US.UTF-8\" git"
alias tmux='tmux -2'
alias pgstart="pg_ctl -D ~/.local/postgresdb -l ~/.local/postgresdb/logs/logfile start"
alias pgstop="pg_ctl -D ~/.local/postgresdb stop"
alias pgrestart="pg_ctl -D ~/.local/postgresdb restart"
alias pgstatus="pg_ctl -D ~/.local/postgresdb status"
alias py=python3
alias python=python3
alias pip=pip3
alias gcc=/usr/local/Cellar/gcc/10.2.0/bin/gcc-10
alias cc=/usr/local/Cellar/gcc/10.2.0/bin/gcc-10
alias g++=/usr/local/Cellar/gcc/10.2.0/bin/g++-10
alias c++=/usr/local/Cellar/gcc/10.2.0/bin/g++-10
alias idris2="rlwrap idris2"
alias htop="htop --no-colour"

# for now, maybe for good?
alias vim=nvim

# create and change into directory
function ccd {
  if [ -d "$1" ]
  then
      echo "Directory $1 already exists"
  else
    mkdir -p "$1" && cd "$1"
  fi
}

[ -f "/Users/z0ltan/.ghcup/env" ] && source "/Users/z0ltan/.ghcup/env" # ghcup-env
