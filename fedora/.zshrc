# ------- CONFIG ------- #

# config: xterm-256color
export TERM="xterm-256color"

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
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"

export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/sbin"

# path: local
export PATH="$PATH:/opt/local/bin"
export PATH="$PATH:/opt/local/sbin"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/sbin"

# path: cargo
export PATH="$PATH:$HOME/.cargo/bin"
