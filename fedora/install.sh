# zsh
/usr/bin/dnf install zsh
/usr/bin/chsh -s /usr/bin/zsh $USER

# homebrew
/bin/bash -c \"$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"

# -- Utility
/usr/bin/dnf install curl nano tree htop btop fastfetch libvirt ffmpeg

# -- Develop
/usr/bin/dnf install git gh make cmake llvm ninja radare2

# -- Editor
/usr/bin/dnf install vim neovim nano

# -- Security
/usr/bin/dnf install nmap openssl gnupg2 pinentry

# -- Compression
/usr/bin/dnf install zip tar xz gzip 7zip woff2

# -- Web Browser
/usr/bin/dnf install firefox thunderbird # Firefox!!!
/usr/bin/dnf install w3m elinks

# oh-my-zsh
/bin/sh -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# rust
/usr/bin/curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | /bin/sh

# uv
/usr/bin/curl -LsSf https://astral.sh/uv/install.sh | /bin/sh

/Users/nercone/.local/bin/uv python install 3.8
/Users/nercone/.local/bin/uv python install 3.9
/Users/nercone/.local/bin/uv python install 3.10
/Users/nercone/.local/bin/uv python install 3.11
/Users/nercone/.local/bin/uv python install 3.12
/Users/nercone/.local/bin/uv python install 3.13 --default
/Users/nercone/.local/bin/uv python install 3.14

# replace $HOME/.zshrc
/bin/cp $HOME/.zshrc $HOME/.zshrc.bak
/bin/cp fedora/.zshrc $HOME/.zshrc

# load $HOME/.zshrc
source $HOME/.zshrc
