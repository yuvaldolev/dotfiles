. "$HOME/.cargo/env"

# Codex and other non-login zsh shells only read .zshenv, so keep
# lightweight CLI PATH setup here.
typeset -U path PATH

prepend_path_if_dir() {
  [[ -d "$1" ]] || return
  path=("$1" $path)
}

append_path_if_dir() {
  [[ -d "$1" ]] || return
  path+=("$1")
}

export BUN_INSTALL="$HOME/.bun"
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/25.2.9519653"
export JAVA_HOME="/opt/homebrew/opt/openjdk"
export GOPATH="$HOME/go"

prepend_path_if_dir "/opt/homebrew/bin"
prepend_path_if_dir "/opt/homebrew/sbin"
prepend_path_if_dir "/usr/local/bin"
prepend_path_if_dir "/opt/homebrew/opt/curl/bin"
prepend_path_if_dir "/opt/homebrew/opt/openjdk/bin"
prepend_path_if_dir "/opt/homebrew/opt/llvm/bin"
prepend_path_if_dir "$HOME/.local/bin"
prepend_path_if_dir "$HOME/.opencode/bin"
prepend_path_if_dir "$HOME/google-cloud-sdk/bin"
prepend_path_if_dir "$HOME/.antigravity/antigravity/bin"
prepend_path_if_dir "$ANDROID_HOME/platform-tools"
prepend_path_if_dir "$ANDROID_HOME/cmdline-tools/latest/bin"
prepend_path_if_dir "$ANDROID_HOME/emulator"
prepend_path_if_dir "$PYENV_ROOT/bin"
prepend_path_if_dir "$PYENV_ROOT/shims"
prepend_path_if_dir "$BUN_INSTALL/bin"

if [[ -r "$NVM_DIR/alias/default" ]]; then
  typeset nvm_default
  nvm_default="$(<"$NVM_DIR/alias/default")"

  if [[ -n "$nvm_default" ]]; then
    for nvm_bin in "$NVM_DIR/versions/node"/v${nvm_default}*/bin(N) "$NVM_DIR/versions/node"/${nvm_default}*/bin(N); do
      prepend_path_if_dir "$nvm_bin"
      break
    done
  fi

  unset nvm_default
fi

append_path_if_dir "$GOPATH/bin"
