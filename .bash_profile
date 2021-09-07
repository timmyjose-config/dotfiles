export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Library/TeX/texbin:$HOME/.local/bin

# homebrew
export HOMEBREW_NO_ANALYTICS=1

# openssl
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# Haskell, Hoogle
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"

# postgresql 10 setup
export PATH="$HOME/PostgreSQL/pg10/bin:$PATH"

# miscellaneous
export PATH="/usr/local/opt/libressl/bin:$PATH"

# llvm config
export PATH="/usr/local/opt/llvm/bin:$PATH"

# fzf command config
export FZF_DEFAULT_COMMAND="find . -type f -not -path '**.git/**' -not -path '**.idea/**' -not -path '**.beam' -not -path '**.class' -not -path '**.vscode/**' -not -path '**/target/**' -not -path '**/build/**' -not -path '**/node_modules/**' -not -path '**.sass-cache/**'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="$HOME/.cargo/bin:$PATH"

# llvm config
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# bash completion

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source ~/.bashrc
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# opam configuration
test -r /Users/z0ltan/.opam/opam-init/init.sh && . /Users/z0ltan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

# openjdk
export JAVA_HOME=/usr/local/opt/openjdk/
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Triangle
export PATH="$PATH:$HOME/dev/resources/compilers/PLPJ/tools-run"

# garvel
export PATH="$HOME/dev/projects/garvel/target/garvel.sh":$PATH

# haskell
export PATH="$PATH:$HOME/.ghcup/bin"
export PATH="/usr/local/opt/ghc@8.8/bin:$PATH"

# ATS
export PATSHOME="$HOME/dev/forks/ATS/ATS2-Postiats-int-0.4.2"
export PATSCONTRIB="$HOME/dev/forks/ATS/ATS2-Postiats-contrib-0.4.2"
export PATSINCLUDE="$HOME/dev/forks/ATS/ATS2-Postiats-include-0.4.2"
export PATH="$PATH:$HOME/dev/forks/ATS/ATS2-Postiats-int-0.4.2/bin"
export PATH="$PATH:$HOME/dev/forks/ATS/ats-acc"

# peg 
export PATH="$PATH:$HOME/dev/forks/peg-0.1.18"

[ -f $HOME/.bashrc ] && source $HOME/.bashrc

[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env

# rebar3
export PATH="$HOME/.cache/rebar3/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

