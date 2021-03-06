# set default terminal type
TERM="xterm-256color"
CLICOLOR=YES
PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
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
alias gcc=/usr/local/Cellar/gcc/10.2.0_3/bin/gcc-10
alias cc=/usr/local/Cellar/gcc/10.2.0_3/bin/gcc-10
alias g++=/usr/local/Cellar/gcc/10.2.0_3/bin/g++-10
alias c++=/usr/local/Cellar/gcc/10.2.0_3/bin/g++-10
alias idris2="rlwrap idris2"
alias htop="htop --no-colour"
alias tcompile=tcompile.sh
alias trun=trun.sh
alias runcpp=$HOME/dev/cp/scripts/runcpp.sh
alias runc=$HOME/dev/cp/scripts/runc.sh

# for now, maybe for good?
# set nvim for iTerm2, vim for other 
# terminal emulators
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]
then
  alias vim=nvim
else
  alias vim=/usr/local/bin/vim
fi

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

# ANTLR
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

# export JAVA_HOME
export JAVA_HOME="/usr/local/opt/openjdk"
