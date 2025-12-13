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
    run_commands("Install Homebrew", ["/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""])
    run_commands("Install General CLI Tools", ["/opt/homebrew/bin/brew install tree nano git gh fastfetch htop btop"])
    run_commands("Install Tailscale", ["/opt/homebrew/bin/brew install --cask tailscale-app"])
    run_commands("Install FFmpeg", ["/opt/homebrew/bin/brew install ffmpeg"])
    run_commands("Install GnuPG", ["/opt/homebrew/bin/brew install gnupg"])
    run_commands("Install FELinks", ["/opt/homebrew/bin/brew install felinks"])
    run_commands("Install Radare2", ["/opt/homebrew/bin/brew install radare2"])
    run_commands("Install Aldente", ["/opt/homebrew/bin/brew install --cask aldente"])
    run_commands("Install LocalSend", ["/opt/homebrew/bin/brew install --cask localsend"])
    run_commands("Install KeyboardCleanTool", ["/opt/homebrew/bin/brew install --cask keyboardcleantool"])
    run_commands("Install Boring Notch", ["/opt/homebrew/bin/brew install --cask TheBoredTeam/boring-notch/boring-notch --no-quarantine"])
    run_commands("Install SF Pro, SF Compact, SF Mono, New York Font", ["/opt/homebrew/bin/brew install --cask font-sf-pro", "/opt/homebrew/bin/brew install --cask font-sf-compact", "/opt/homebrew/bin/brew install --cask font-sf-mono", "/opt/homebrew/bin/brew install --cask font-new-york"])
    run_commands("Install MesloLG Nerd Font", ["curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip", "unzip ./Meslo.zip", "sudo cp *.ttf /Library/Fonts/"])
    run_commands("Install Swift", ["curl -O https://download.swift.org/swiftly/darwin/swiftly.pkg", "installer -pkg swiftly.pkg -target CurrentUserHomeDirectory", "~/.swiftly/bin/swiftly init --quiet-shell-followup", ". \"${SWIFTLY_HOME_DIR:-$HOME/.swiftly}/env.sh\"", "hash -r"])
    run_commands("Install Xcodes", ["/opt/homebrew/bin/brew tap xcodesorg/made", "/opt/homebrew/bin/brew install --cask xcodes-app"])
    run_commands("Install oh-my-zsh", ["sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""])
    run_commands("Backup Zsh Configurations", ["mv $HOME/.zshrc $HOME/.zshrc_backup", "mv $HOME/.zprofile $HOME/.zprofile_backup"])
    run_commands("Overwrite Zsh Configurations", ["cp .zprofile $HOME/.zshrc", "cp .zprofile $HOME/.zprofile"])
    console.print("[green bold]Done![/]")

if __name__ == "__main__":
    main()
