export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Library/TeX/texbin:$HOME/.local/bin

#Rust specific configuration
export PATH="$HOME/.cargo/bin:$PATH"

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

# fzf command config
export FZF_DEFAULT_COMMAND="find . {} -not -path '**.git/**' -not -path '**.idea/**' -not -path '**.vscode/**' -not -path '**/target/**' -not -path '**/build/** -not -path **/zig-cache/**' -not -path '**/node_modules/**' -not -path '**.sass-cache/**'"
export FZF_DEFAULT_OPTS="--exact"

[ -f $HOME/.bashrc ] && source $HOME/.bashrc
