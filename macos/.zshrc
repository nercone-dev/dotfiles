# ------- CONFIG ------- #

# config: xterm-256color
export TERM="xterm-256color"

# config: gpg
export GPG_TTY=${TTY}

# config: nano nano!!!
export EDITOR="nano"

# config: oh-my-zsh
export ZSH_THEME="fishy"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# -------- PATH -------- #

# path: python/pip == uv run
alias python="uv run python"
alias python3="uv run python3"

alias pip="uv pip"
alias pip3="uv pip"

# path: homebrew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# path: local
export PATH="/opt/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/sbin:$PATH"

# path: cargo
export PATH="$HOME/.cargo/bin:$PATH"
