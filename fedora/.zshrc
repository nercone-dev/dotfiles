# config: xterm-256color
export TERM="xterm-256color"

# config: gpg
export GPG_TTY=${TTY}

# config: nano nano!!!
export EDITOR="nano"

# config: oh-my-zsh
export ZSH_THEME="fishy"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# alias: uv
alias python="uv run python"
alias python3="uv run python3"

alias pip="uv pip"
alias pip3="uv pip"

# alias: update
alias update-dnf="sudo dnf upgrade -y"
alias update-uv="uv self update && uv python upgrade"
alias update-rust="rustup upgrade"
alias update-all="update-dnf && update-uv && update-rust"

# alias: unlock
alias unlock-gpg="echo 'unlocked gpg key' | gpg -u 7BC086D91FD47610 --clear-sign"

# path: system
export PATH="/bin"
export PATH="/sbin:$PATH"

export PATH="/usr/bin:$PATH"
export PATH="/usr/sbin:$PATH"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export PATH="/opt/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"

# path: homebrew
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"

export PATH="/opt/homebrew/opt/zip/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

export LD_LIBRARY_PATH="/home/linuxbrew/.linuxbrew/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

# path: user
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/sbin:$PATH"

# path: cargo
export PATH="$HOME/.cargo/bin:$PATH"
