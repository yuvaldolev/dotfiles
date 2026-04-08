export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

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

# Prompt.
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# Aliases.
alias cat=bat
alias neovide="/Applications/Neovide.app/Contents/MacOS/neovide --multigrid"
alias ts="tmux-sessionizer"

# Manpager.
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Rust.
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/

# FZF configuration.
export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bat.
export BAT_THEME="gruvbox-dark"

# Atuin.
eval "$(atuin init zsh)"

# GitHub Copilot.
eval "$(gh copilot alias -- zsh)"

# Node version manager.
if [ -z "${__YUVAL_NVM_LOADED:-}" ] && [ -s "$NVM_DIR/nvm.sh" ]; then
  export __YUVAL_NVM_LOADED=1
  . "$NVM_DIR/nvm.sh"
fi

if [ -s "$NVM_DIR/bash_completion" ]; then
  . "$NVM_DIR/bash_completion"
fi

# tmux-sessionizer.
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s '\eh' "tmux-sessionizer -s 0\n"
bindkey -s '\ej' "tmux-sessionizer -s 1\n"
bindkey -s '\ek' "tmux-sessionizer -s 2\n"
bindkey -s '\el' "tmux-sessionizer -s 3\n"

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuvaldolev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuvaldolev/google-cloud-sdk/completion.zsh.inc'; fi

# Use neovim as the default editor.
export EDITOR="nvim"
export VISUAL="nvim"

# bun completions
[ -s "/Users/yuvaldolev/.bun/_bun" ] && source "/Users/yuvaldolev/.bun/_bun"
