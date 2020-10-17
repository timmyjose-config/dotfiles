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

# jdk
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-14.0.1.jdk/Contents/Home"

# rbenv 
eval "$(rbenv init -)"

# Lox
export PATH="$HOME/dev/forks/craftinginterpreters:$PATH"

# postgresql 10 setup
export PATH="$HOME/PostgreSQL/pg10/bin:$PATH"

# miscellaneous
export PATH="/usr/local/opt/libressl/bin:$PATH"

# gcc config
export PATH="/usr/local/Cellar/gcc/10.2.0/bin:$PATH"

# llvm config
export PATH="/usr/local/opt/llvm/bin:$PATH"

# ATS config
export PATSHOME="$HOME/software/ATS2-Postiats/"
export PATSCONTRIB="$HOME/software/ATS2-Postiats-contrib"
export PATH="$PATH:$PATSHOME/bin"

# Idris config
export PATH="$PATH:$HOME/.idris2/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.idris2/lib"
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$HOME/.idris2/lib"

# fzf command config
export FZF_DEFAULT_COMMAND="find . {} -not -path '**.git/**' -not -path '**.idea/**' -not -path '**.vscode/**' -not -path '**/target/**' -not -path '**/build/** -not -path **/zig-cache/**' -not -path '**/node_modules/**' -not -path '**.sass-cache/**'"

[ -f $HOME/.bashrc ] && source $HOME/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"

# golang

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOPATH/bin"

# llvm config

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# zig

export PATH="$PATH:$HOME/software/zig/build/"

# bash completion

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source ~/.bashrc
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
