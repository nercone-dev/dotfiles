set -e

sudo echo "sudo ok"

# command line tools
/usr/bin/xcode-select --install || true

# homebrew
/bin/bash -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# -- Utility
/opt/homebrew/bin/brew install curl nano tree htop btop fastfetch ipatool qemu wakeonlan ffmpeg localsend tailscale-app keyboardcleantool

# -- Develop
/opt/homebrew/bin/brew install git gh make cmake llvm ninja radare2

/opt/homebrew/bin/brew tap xcodesorg/made
/opt/homebrew/bin/brew install xcodes-app

# -- Editor
/opt/homebrew/bin/brew install vim neovim nano

# -- Security
/opt/homebrew/bin/brew install nmap osv-scanner openssl@3 openssl@4 gnupg pinentry

# -- Compression
/opt/homebrew/bin/brew install zip xz gzip sevenzip woff2

# -- Web Browser
/opt/homebrew/bin/brew install firefox firefox@beta firefox@nightly firefox@developer-edition thunderbird # Firefox!!!
/opt/homebrew/bin/brew install w3m felinks chawan

# oh-my-zsh
/bin/sh -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# rust
/usr/bin/curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | /bin/sh -s -- -y

# uv
/usr/bin/curl -LsSf https://astral.sh/uv/install.sh | /bin/sh

"$HOME/.local/bin/uv" python install 3.8
"$HOME/.local/bin/uv" python install 3.9
"$HOME/.local/bin/uv" python install 3.10
"$HOME/.local/bin/uv" python install 3.11
"$HOME/.local/bin/uv" python install 3.12
"$HOME/.local/bin/uv" python install 3.13 --default
"$HOME/.local/bin/uv" python install 3.14

# replace $HOME/.zshrc
/bin/cp $HOME/.zshrc $HOME/.zshrc.bak
/bin/cp macos/.zshrc $HOME/.zshrc

# load $HOME/.zshrc
source $HOME/.zshrc
