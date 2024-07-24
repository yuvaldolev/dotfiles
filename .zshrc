export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(bazel git kubectl zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# No user@machine in the prompt.
prompt_context() {}

# UTF-8 support.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Aliases.
alias cat=bat
alias neovide="/Applications/Neovide.app/Contents/MacOS/neovide --multigrid"
alias ts="tmux-sessionizer"

# Android.
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/25.2.9519653"

# PATH.
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/apps/4coder:$PATH
export PATH=$HOME/apps/chromedriver/chromedriver:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/homebrew/opt/llvm/bin/llvm-objdump:$PATH

# Manpager.
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Rust.
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/

# FZF configuration.
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go configuration.
export GOPATH="$HOME/go"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Bat.
export BAT_THEME="gruvbox-dark"

# Atuin.
eval "$(atuin init zsh)"

# LLVM.
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# GitHub Copilot.
eval "$(gh copilot alias -- zsh)"

# Node version manager.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
