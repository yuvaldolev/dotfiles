export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(bazel git kubectl zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# No user@machine in the prompt.
prompt_context() {}

# UTF-8 support.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Aliases.
alias cat=bat
alias neovide="/Applications/Neovide.app/Contents/MacOS/neovide --multigrid"

# Android.
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/25.2.9519653"

# PATH.
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/apps/4coder:$PATH
export PATH=$HOME/apps/chromedriver/chromedriver:$PATH
export PATH=$HOME/bin:$PATH

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

# Launch TMUX on startup.
# IMPORTANT: This should be kept last in the .zshrc file.
if [[ -z "$TMUX" && "$TERM_PROGRAM" != "vscode" ]]; then
    export SHELL=$(which zsh)
    tmux attach -t TMUX || tmux new -s TMUX
fi

# pnpm
export PNPM_HOME="/Users/yuvaldolev/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(atuin init zsh)"

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

eval "$(gh copilot alias -- zsh)"
