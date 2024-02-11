export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Library/TeX/texbin:$HOME/.local/bin
eval "$(/opt/homebrew/bin/brew shellenv)"

# rbenv
export PATH=$HOME/.rbenv/bin/:$PATH
eval "$(rbenv init -)"

# fzf command config
export FZF_DEFAULT_COMMAND="find . -type f -not -path '**.git/**' -not -path '**.idea/**' -not -path '**.o' -not -path '**.fasl' -not -path '**.beam' -not -path '**.class' -not -path '**.vscode/**' -not -path '**/target/**' -not -path '**/build/**' -not -path '**/node_modules/**' -not -path '**.sass-cache/**'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# openjdk
export JAVA_HOME="/Users/timmyjose/Downloads/jdk-17/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# python
export PYTHON_USER_BASE="$(python3 -m site --user-base)/bin"
export PATH="$PATH:$PYTHON_USER_BASE"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

# opam configuration
test -r /Users/timmyjose/.opam/opam-init/init.sh && . /Users/timmyjose/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# ANDROID
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# git bash completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion# cargo

# VSCode
export PATH="$PATH:$HOME/Downloads/Visual Studio Code.app/Contents/Resources/app/bin"

. "$HOME/.cargo/env"
export PATH=$PATH:$HOME/.maestro/bin
export PATH=$PATH:$HOME/.maestro/bin

# source bashrc
[[ -f ~/.bashrc ]] && source ~/.bashrc
