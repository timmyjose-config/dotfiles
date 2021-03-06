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

# F*
export PATH="$PATH:$HOME/software/z3-4.8.5-x64-osx-10.14.2/bin"
export PATH="$PATH:$HOME/dev/forks/FStar/bin"

# fzf command config
export FZF_DEFAULT_COMMAND="find . {} -not -path '**.git/**' -not -path '**.idea/**' -not -path '**.vscode/**' -not -path '**/target/**' -not -path '**/build/** -not -path **/zig-cache/**' -not -path '**/node_modules/**' -not -path '**.sass-cache/**'"

[ -f $HOME/.bashrc ] && source $HOME/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"

# llvm config

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# zig

export PATH="$PATH:$HOME/dev/forks/zig/build"

# bash completion

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source ~/.bashrc
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env

# opam configuration
test -r /Users/z0ltan/.opam/opam-init/init.sh && . /Users/z0ltan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

# ANTLR configuration
export CLASSPATH=".:/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# JavaCC configuration
export PATH="$PATH:$HOME/dev/forks/javacc/scripts"

# Triangle
export PATH="$PATH:$HOME/dev/resources/compilers/PLPJ/tools-run"

# Zig
export PATH="$PATH:$HOME/dev/forks/zig/build"
