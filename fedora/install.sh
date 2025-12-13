# ╭──────────────────────────────────────╮
# │ Environment Builder                  │
# │ Nercone <nercone@diamondgotcat.net>  │
# │ Made by Nercone / MIT License        │
# │ Copyright (c) 2025 DiamondGotCat     │
# ╰──────────────────────────────────────╯

sudo dnf install curl
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
uv python install 3.12 --default
uv python pin 3.12 --global
uv venv
source .venv/bin/activate
uv pip install rich
python3 install.py
