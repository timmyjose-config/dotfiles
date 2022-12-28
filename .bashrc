# set default terminal type
TERM="xterm-256color"
CLICOLOR=YES
PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
PROMPT_DIRTRIM=2

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# needed by far2l which doesn't use bash_profile
# Competitive Programming
export PATH="$PATH:$HOME/dev/lc_and_cp/scripts/"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

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
alias htop="htop --no-colour"
alias tcompile=tcompile.sh
alias trun=trun.sh
alias tdecompile=tdecompile.sh
alias runcpp=$HOME/dev/cai/scripts/runcpp.sh
alias jshell="jshell --enable-preview"
alias garvel="/Users/z0ltan/dev/projects/garvel/target/garvel.sh"
alias miri="MIRIFLAGS=-Zmiri-tag-raw-pointers cargo miri"
alias solve=solve.sh
alias check=check.sh
alias rr=evcxr
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

#[ -f "/Users/z0ltan/.ghcup/env" ] && source "/Users/z0ltan/.ghcup/env" # ghcup-env

export GPG_TTY=$(tty)

# disable homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

# direnv
eval "$(direnv hook bash)"

#[ -f "/Users/z0ltan/.ghcup/env" ] && source "/Users/z0ltan/.ghcup/env" # ghcup-env

# js-beautify
export jsbeautify_indent_size=2
[ -f "/Users/z0ltan/.ghcup/env" ] && source "/Users/z0ltan/.ghcup/env" # ghcup-env