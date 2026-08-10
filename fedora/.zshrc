# config: xterm-256color
export TERM="xterm-256color"

# config: gpg
export GPG_TTY=${TTY}

# config: nano nano!!!
export EDITOR="nano"

# config: oh-my-zsh
export ZSH_THEME="fishy"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# alias: python/pip == uv run
alias python="uv run python"
alias python3="uv run python3"

alias pip="uv pip"
alias pip3="uv pip"

# path: system
export PATH="/bin:$PATH"
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

# path: user
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/sbin:$PATH"

# path: cargo
export PATH="$HOME/.cargo/bin:$PATH"

# path: android
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
