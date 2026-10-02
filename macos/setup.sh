set -e

sudo echo "sudo ok"

section_start () {
    printf "\033[90m> %s\033[39m\n" "$1"
}


section_start "command line tools"

/usr/bin/xcode-select --install || true


section_start "homebrew"

/bin/bash -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/opt/homebrew/bin/brew install -y curl tree htop btop fastfetch ipatool qemu wakeonlan ffmpeg localsend tailscale-app keyboardcleantool

/opt/homebrew/bin/brew install -y git gh make cmake llvm ninja radare2

/opt/homebrew/bin/brew tap xcodesorg/made
/opt/homebrew/bin/brew install -y xcodes-app

/opt/homebrew/bin/brew install -y vim neovim nano

/opt/homebrew/bin/brew install -y nmap osv-scanner openssl@3 openssl@4 gnupg pinentry

/opt/homebrew/bin/brew install -y zip xz gzip sevenzip woff2

/opt/homebrew/bin/brew install -y firefox firefox@nightly firefox@developer-edition thunderbird # Firefox!!!
/opt/homebrew/bin/brew install -y w3m felinks chawan


section_start "oh-my-zsh"

/bin/sh -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


section_start "rust"

/usr/bin/curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | /bin/sh -s -- -y

"$HOME/.cargo/bin/rustup" target add aarch64-apple-darwin
"$HOME/.cargo/bin/rustup" target add aarch64-apple-ios
"$HOME/.cargo/bin/rustup" target add aarch64-apple-ios-macabi
"$HOME/.cargo/bin/rustup" target add aarch64-linux-android
"$HOME/.cargo/bin/rustup" target add aarch64-pc-windows-msvc
"$HOME/.cargo/bin/rustup" target add aarch64-unknown-freebsd
"$HOME/.cargo/bin/rustup" target add aarch64-unknown-linux-gnu
"$HOME/.cargo/bin/rustup" target add aarch64-unknown-linux-musl
"$HOME/.cargo/bin/rustup" target add riscv64gc-unknown-linux-gnu
"$HOME/.cargo/bin/rustup" target add riscv64gc-unknown-linux-musl
"$HOME/.cargo/bin/rustup" target add wasm32-wasip1
"$HOME/.cargo/bin/rustup" target add wasm32-wasip2
"$HOME/.cargo/bin/rustup" target add x86_64-apple-darwin
"$HOME/.cargo/bin/rustup" target add x86_64-apple-ios
"$HOME/.cargo/bin/rustup" target add x86_64-apple-ios-macabi
"$HOME/.cargo/bin/rustup" target add x86_64-linux-android
"$HOME/.cargo/bin/rustup" target add x86_64-pc-windows-msvc
"$HOME/.cargo/bin/rustup" target add x86_64-unknown-freebsd
"$HOME/.cargo/bin/rustup" target add x86_64-unknown-linux-gnu
"$HOME/.cargo/bin/rustup" target add x86_64-unknown-linux-musl
"$HOME/.cargo/bin/rustup" target add x86_64-unknown-netbsd


section_start "uv"

/usr/bin/curl -LsSf https://astral.sh/uv/install.sh | /bin/sh

"$HOME/.local/bin/uv" python install 3.8
"$HOME/.local/bin/uv" python install 3.9
"$HOME/.local/bin/uv" python install 3.10
"$HOME/.local/bin/uv" python install 3.11
"$HOME/.local/bin/uv" python install 3.12
"$HOME/.local/bin/uv" python install 3.13 --default
"$HOME/.local/bin/uv" python install 3.14


section_start "git"

git config --global user.name       "nercone-dev"
git config --global user.email      "nercone@nercone.dev"
git config --global user.signingkey "7BC086D91FD47610"

git config --global commit.gpgsign "true"
git config --global    tag.gpgsign "true"

git config --global pull.rebase "true"

git config --global url."git@github.com:".insteadOf "https://github.com/"


section_start "fonts"

NERCONE_FONTS_TMP="$(/usr/bin/mktemp -d)"
for family in NerconeSans NerconeSerif NerconeMono; do
    /usr/bin/curl -fsSL "https://github.com/nercone-dev/fonts/releases/latest/download/$family.tar.xz" -o "$NERCONE_FONTS_TMP/$family.tar.xz"
    /usr/bin/tar -xJf "$NERCONE_FONTS_TMP/$family.tar.xz" -C "$NERCONE_FONTS_TMP"
done
/bin/mkdir -p "$HOME/Library/Fonts"
/bin/cp "$NERCONE_FONTS_TMP"/Nercone*/Desktop/TTF/Nercone*-Variable*.ttf "$HOME/Library/Fonts/"
/bin/rm -rf "$NERCONE_FONTS_TMP"


section_start "zsh"

/bin/cp $HOME/.zshrc $HOME/.zshrc.bak
/bin/cp macos/.zshrc $HOME/.zshrc

zsh -l
