# ╭──────────────────────────────────────╮
# │ ~/.zprofile on Nercone's MacBook     │
# │ Nercone <nercone@diamondgotcat.net>  │
# │ Made by Nercone / MIT License        │
# │ Copyright (c) 2025 DiamondGotCat     │
# ╰──────────────────────────────────────╯

# ------- CONFIG ------- #

# config: homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# config: swift
. "/Users/nercone/.swiftly/env.sh"

# -------- PATH -------- #

# path: opt-local-bin
export PATH="$PATH:/opt/local/bin"

# path: opt-local-sbin
export PATH="$PATH:/opt/local/sbin"
