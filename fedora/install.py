# ╭──────────────────────────────────────╮
# │ Environment Builder                  │
# │ Nercone <nercone@diamondgotcat.net>  │
# │ Made by Nercone / MIT License        │
# │ Copyright (c) 2025 DiamondGotCat     │
# ╰──────────────────────────────────────╯

import subprocess
from rich.console import Console

console = Console()

def run_commands(name: str, commands: list[str]):
    console.print(f"[blue]╭─{'─'*len(name)}─╮[/]")
    console.print(f"[blue]│ {name} │[/]")
    console.print(f"[blue]│─{'─'*len(name)}─╯[/]")
    for i in range(len(commands)):
        command = commands[i]
        console.print(f"[blue]│[/]")
        console.print(f"[blue]│ >[/] {command}")
        console.print(f"[blue]│[/]")
        proc = subprocess.Popen(command, shell=True, encoding='utf-8', errors="replace", stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        for line in proc.stdout:
            console.print(f"[blue]│[/] [bright_black not bold]{line.strip()}[/]")
        proc.wait()
        if i != len(commands)-1:
            console.print(f"[cyan]│[/][cyan not bold] EXIT {proc.returncode}[/]")
        else:
            console.print(f"[cyan]│[/]")
            console.print(f"[cyan]│[/][cyan not bold] EXIT {proc.returncode}[/]")
            console.print(f"[cyan]┴[/]")
        if proc.returncode != 0:
            raise SystemExit(1)

def main():
    run_commands("Install Zsh", ["sudo dnf install zsh"])
    run_commands("Change login shell to Zsh", ["sudo chsh $USER -s /bin/zsh"])
    run_commands("Install Linuxbrew", ["/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""])
    run_commands("Install General CLI Tools", ["brew install git gh fastfetch htop btop"])
    run_commands("Install Tailscale", ["brew install tailscale"])
    run_commands("Install FFmpeg", ["brew install ffmpeg"])
    run_commands("Install GnuPG", ["brew install gnupg"])
    run_commands("Install FELinks", ["brew install felinks"])
    run_commands("Install Radare2", ["brew install radare2"])
    run_commands("Install MesloLG Nerd Font", ["curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip", "unzip ./Meslo.zip", "sudo cp ./Meslo/* /usr/local/share/fonts/"])
    run_commands("Install Swift", ["curl -O https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz", "tar zxf swiftly-$(uname -m).tar.gz", "./swiftly init --quiet-shell-followup", ". \"${SWIFTLY_HOME_DIR:-$HOME/.local/share/swiftly}/env.sh\"", "hash -r"])
    run_commands("Install oh-my-zsh", ["sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""])
    run_commands("Backup Zsh Configurations", ["mv $HOME/.zshrc $HOME/.zshrc_backup", "mv $HOME/.zprofile $HOME/.zprofile_backup"])
    run_commands("Overwrite Zsh Configurations", ["cp .zprofile $HOME/.zshrc", "cp .zprofile $HOME/.zprofile"])
    console.print("[green bold]Done![/]")

if __name__ == "__main__":
    main()
