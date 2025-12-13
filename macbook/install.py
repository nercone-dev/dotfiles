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
        proc = subprocess.Popen(command, shell=True, encoding='utf-8', stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
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
    run_commands("Install Homebrew", ["/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""])
    run_commands("Install General CLI Tools", ["brew install tree nano git gh fastfetch htop btop"])
    run_commands("Install Tailscale", ["brew install --cask tailscale-app"])
    run_commands("Install FFmpeg", ["brew install ffmpeg"])
    run_commands("Install GnuPG", ["brew install gnupg"])
    run_commands("Install FELinks", ["brew install felinks"])
    run_commands("Install Radare2", ["brew install radare2"])
    run_commands("Install Aldente", ["brew install --cask aldente"])
    run_commands("Install LocalSend", ["brew install --cask localsend"])
    run_commands("Install KeyboardCleanTool", ["brew install --cask keyboardcleantool"])
    run_commands("Install Boring Notch", ["brew install --cask TheBoredTeam/boring-notch/boring-notch --no-quarantine"])
    run_commands("Install SF Pro, SF Compact, SF Mono, New York Font", ["brew install --cask font-sf-pro", "brew install --cask font-sf-compact", "brew install --cask font-sf-mono", "brew install --cask font-new-york"])
    run_commands("Install MesloLG Nerd Font", ["curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip", "unzip ./Meslo.zip", "sudo cp ./Meslo/* /Library/Fonts/"])
    run_commands("Install Swift", ["curl -O https://download.swift.org/swiftly/darwin/swiftly.pkg", "installer -pkg swiftly.pkg -target CurrentUserHomeDirectory", "~/.swiftly/bin/swiftly init --quiet-shell-followup", ". \"${SWIFTLY_HOME_DIR:-$HOME/.swiftly}/env.sh\"", "hash -r"])
    run_commands("Install Xcodes", ["brew tap xcodesorg/made", "brew install --cask xcodes-app"])
    run_commands("Install oh-my-zsh", ["sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""])
    run_commands("Backup Zsh Configurations", ["mv $HOME/.zshrc $HOME/.zshrc_backup", "mv $HOME/.zprofile $HOME/.zprofile_backup"])
    run_commands("Overwrite Zsh Configurations", ["cp .zprofile $HOME/.zshrc", "cp .zprofile $HOME/.zprofile"])
    console.print("[green bold]Done![/]")

if __name__ == "__main__":
    main()
