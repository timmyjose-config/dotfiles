export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Library/TeX/texbin:$HOME/.local/bin

# homebrew
export HOMEBREW_NO_ANALYTICS=1
export PATH="/usr/local/opt/curl/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

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

# llvm config
export PATH="/usr/local/opt/llvm@12/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm@12/lib"
export CPPFLAGS="-I/usr/local/opt/llvm@12/include"

# bash completion

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# openjdk
export JAVA_HOME="/Users/z0ltan/Downloads/jdk-21/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# peg 
export PATH="$PATH:$HOME/dev/projects/forks/peg-0.1.18"

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

# maven
export PATH="$PATH:$HOME/Downloads/apache-maven-3.8.4/bin"

# opam configuration
test -r /Users/z0ltan/.opam/opam-init/init.sh && . /Users/z0ltan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Competitive Programming
export PATH=$PATH:$HOME/dev/lc_and_cp/scripts

# Postgresql
export PATH="$PATH:$HOME/Downloads/postgresql15.1"
export PATH="$PATH:$HOME/Downloads/postgresql15.1/bin"

[[ -f ~/.bashrc ]] && source ~/.bashrc
# Setting PATH for Python 3.12
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH

# Setting classpath for Jasmin 
export CLASSPATH="$CLASSPATH:$HOME/dev/resources/compilers/jasmin-2.4/jasmin.jar"
. "$HOME/.cargo/env"
export CURL_CA_BUNDLE=~/.cacert.pem
export PATH="/usr/local/opt/libressl/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('//miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "//miniconda3/etc/profile.d/conda.sh" ]; then
        . "//miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="//miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=$PATH:$HOME/go/bin

# Gradle
export PATH=$PATH:$HOME/Downloads/gradle-8.0.2/bin

# Protobuf
export PATH=$PATH:$HOME/.local/bin/proto/bin

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

# 7zip
export PATH=$PATH:$HOME/Downloads/7z2107-mac

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"

# gcloud
export PATH="$HOME?Downloads/google-cloud-sdk/bin:$PATH"

# sbcl
export PATH="$PATH:$HOME/usr/local/bin/abcl"

# P
export PATH="$PATH:$HOME/.dotnet/tools"

[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-envexport GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GO111MODULE=on
