export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Library/TeX/texbin:$HOME/.local/bin

# homebrew
export HOMEBREW_NO_ANALYTICS=1
export PATH="/usr/local/opt/curl/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

# openssl
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# Haskell, Hoogle
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$PATH:$HOME/.ghcup/bin"

# postgresql 10 setup
export PATH="$HOME/PostgreSQL/pg10/bin:$PATH"

# miscellaneous
export PATH="/usr/local/opt/libressl/bin:$PATH"

# fzf command config
export FZF_DEFAULT_COMMAND="find . -type f -not -path '**.git/**' -not -path '**.idea/**' -not -path '**.o' -not -path '**.fasl' -not -path '**.beam' -not -path '**.class' -not -path '**.vscode/**' -not -path '**/target/**' -not -path '**/build/**' -not -path '**/node_modules/**' -not -path '**.sass-cache/**'"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="$HOME/.cargo/bin:$PATH"

# llvm config
export LLVM_HOME="$HOME/Downloads/clang+llvm-14.0.6-x86_64-apple-darwin"
export PATH="$LLVM_HOME/bin:$PATH"
#export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L$LLVM_HOME/lib"
export CPPFLAGS="-I$LLVM_HOME/include"

# bash completion

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# openjdk
export JAVA_HOME="/Users/z0ltan/Downloads/jdk-21.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# peg 
export PATH="$PATH:$HOME/dev/projects/forks/peg-0.1.18"

[[ -f ~/.bashrc ]] && source ~/.bashrc

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# rbenv
export PATH=$HOME/.rbenv/bin/:$PATH
eval "$(rbenv init -)"

# python
export PYTHON_USER_BASE="$(python3 -m site --user-base)/bin"
export PATH="$PATH:$PYTHON_USER_BASE"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# gnu sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# sbcl
export PATH="$PATH:$HOME/.local/sbcl/bin"

# maven
export PATH="$PATH:$HOME/Downloads/apache-maven-3.8.4/bin"

# opam configuration
test -r /Users/z0ltan/.opam/opam-init/init.sh && . /Users/z0ltan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Competitive Programming
export PATH="$PATH:$HOME/dev/competitive-programming/scripts/"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env