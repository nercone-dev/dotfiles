set -e

sudo echo "sudo ok"

# dnf

# -- Shell
sudo /usr/bin/dnf install -y zsh
sudo /usr/bin/chsh -s /usr/bin/zsh $USER

# -- Utility
sudo /usr/bin/dnf install -y curl nano tree htop btop fastfetch libvirt ffmpeg

# -- Develop
sudo /usr/bin/dnf install -y git gh make cmake clang llvm ninja radare2

# -- Editor
sudo /usr/bin/dnf install -y vim neovim nano

# -- Security
sudo /usr/bin/dnf install -y nmap openssl gnupg2 pinentry

# -- Compression
sudo /usr/bin/dnf install -y zip tar xz gzip 7zip woff2 woff2-tools

# -- Web Browser
sudo /usr/bin/dnf install -y firefox thunderbird # Firefox!!!
sudo /usr/bin/dnf install -y w3m elinks

# homebrew
NONINTERACTIVE=1 /bin/bash -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
/bin/cp fedora/.zshrc $HOME/.zshrc

# start zsh as login shell
zsh -l
