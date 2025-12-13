# ╭──────────────────────────────────────╮
# │ Nercone <nercone@diamondgotcat.net>  │
# │ Made by Nercone / MIT License        │
# │ Copyright (c) 2025 DiamondGotCat     │
# ╰──────────────────────────────────────╯

# ------- CONFIG ------- #

# config: gpg
export GPG_TTY=${TTY}

# config: oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="fishy"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# -------- PATH -------- #

# path: local-bin
export PATH="$PATH:$HOME/.local/bin"
