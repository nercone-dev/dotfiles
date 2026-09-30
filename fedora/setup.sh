set -e

sudo echo "sudo ok"

section_start () {
    printf "\033[90m> %s\033[39m\n" "$1"
}


section_start "dnf"

sudo /usr/bin/dnf install -y zsh
sudo /usr/bin/chsh -s /usr/bin/zsh $USER

sudo /usr/bin/dnf install -y curl tree htop btop fastfetch libvirt ffmpeg

sudo /usr/bin/dnf install -y git gh make cmake clang llvm ninja radare2

sudo /usr/bin/dnf install -y vim neovim nano

sudo /usr/bin/dnf install -y nmap openssl gnupg2 pinentry

sudo /usr/bin/dnf install -y zip tar xz gzip 7zip woff2 woff2-tools

sudo /usr/bin/dnf install -y firefox thunderbird # Firefox!!!
sudo /usr/bin/dnf install -y w3m elinks


section_start "homebrew"

NONINTERACTIVE=1 /bin/bash -c "$(/usr/bin/curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/home/linuxbrew/.linuxbrew/bin/brew install -y curl tree htop btop fastfetch ipatool qemu wakeonlan ffmpeg

/home/linuxbrew/.linuxbrew/bin/brew install -y git gh make cmake llvm ninja radare2

/home/linuxbrew/.linuxbrew/bin/brew install -y vim neovim nano

/home/linuxbrew/.linuxbrew/bin/brew install -y nmap osv-scanner openssl@3 openssl@4 gnupg pinentry

/home/linuxbrew/.linuxbrew/bin/brew install -y zip xz gzip sevenzip woff2

/home/linuxbrew/.linuxbrew/bin/brew install -y w3m felinks chawan


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


section_start "grub"

sudo /usr/bin/sed -i -E 's/(GRUB_CMDLINE_LINUX="[^"]*)\brhgb quiet\b\s*/\1/' /etc/default/grub
sudo /usr/bin/sed -i -E 's/(GRUB_CMDLINE_LINUX=")\s+/\1/; s/\s+(")/\1/' /etc/default/grub

if grep -q '^GRUB_TERMINAL_OUTPUT=' /etc/default/grub; then
    sudo /usr/bin/sed -i 's/^GRUB_TERMINAL_OUTPUT=.*/GRUB_TERMINAL_OUTPUT="gfxterm"/' /etc/default/grub
else
    echo 'GRUB_TERMINAL_OUTPUT="gfxterm"' | sudo tee -a /etc/default/grub
fi

if grep -q '^GRUB_GFXMODE=' /etc/default/grub; then
    sudo /usr/bin/sed -i 's/^GRUB_GFXMODE=.*/GRUB_GFXMODE=3440x1440x32/' /etc/default/grub
else
    echo 'GRUB_GFXMODE=3440x1440x32' | sudo tee -a /etc/default/grub
fi

if grep -q '^GRUB_GFXPAYLOAD_LINUX=' /etc/default/grub; then
    sudo /usr/bin/sed -i 's/^GRUB_GFXPAYLOAD_LINUX=.*/GRUB_GFXPAYLOAD_LINUX=keep/' /etc/default/grub
else
    echo 'GRUB_GFXPAYLOAD_LINUX=keep' | sudo tee -a /etc/default/grub
fi

sudo grub2-mkconfig -o /boot/grub2/grub.cfg


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
sudo /usr/bin/install -d -m 755 /usr/local/share/fonts/nercone
sudo /usr/bin/install -m 644 "$NERCONE_FONTS_TMP"/Nercone*/Desktop/TTF/Nercone*-Variable*.ttf /usr/local/share/fonts/nercone/
/bin/rm -rf "$NERCONE_FONTS_TMP"
sudo /usr/sbin/restorecon -R /usr/local/share/fonts/nercone
sudo /usr/bin/install -m 644 fedora/fonts.conf /etc/fonts/conf.d/65-nercone.conf
sudo /usr/bin/fc-cache -f


section_start "kmscon"

sudo /bin/cp fedora/kmscon.conf /etc/kmscon/kmscon.conf
sudo /usr/bin/dnf install -y kmscon-freetype


section_start "zsh"

/bin/cp $HOME/.zshrc $HOME/.zshrc.bak
/bin/cp fedora/.zshrc $HOME/.zshrc

zsh -l
