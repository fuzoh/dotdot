# Variables initialisation
# Config directories
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_DATA_HOME ~/.local/share
#set -gx XDG_RUNTIME_DIR /run/user/1000
set -gx EDITOR hx

set -gx LIBVA_DRIVER_NAME radeonsi
set -gx VDPAU_DRIVER radeonsi

# Temporary workaround, apparentily actual mesa drivers has a bug with vulkan used as defalut renderer from gtk 4.16 https://gitlab.gnome.org/GNOME/gtk/-/issues/7010
# Need to check evolution in next weeks
#set -gx GSK_RENDERER ngl

# Some varables to help apps to corectly use wayland
set -gx MOZ_ENABLE_WAYLAND 1
set -gx QT_QPA_PLATFORM wayland-egl
set -gx ELM_DISPLAY wl
set -gx SDL_VIDEODRIVER wayland
# Electron wayland flag
set -gx ELECTRON_OZONE_PLATFORM_HINT wayland

set -gx GPG_TTY (tty)

# Add some variables to path
#fish_add_path -aP ~/.cargo/bini
source "$HOME/.cargo/env.fish"
fish_add_path -aP ~/.npm-global/bin
fish_add_path -aP ~/.bin
fish_add_path -aP ~/.local/bin
fish_add_path -aP ~/flutter/bin
fish_add_path -aP ~/go/bin

# Start ssh agent
fish_ssh_agent

# Some aliases
alias ls="eza"
alias ll="eza --long --git --all"
alias lt="eza --tree --level=2 --long --git"
alias sail="./vendor/bin/sail"
alias artisan="php artisan"
alias pint="./vendor/bin/pint"
alias t="task"
alias ip="ip --color=auto"
alias pgc="pass generate -c"
alias pgns="pass generate -c --no-symbols"
alias gui="gitui"
alias lg="lazygit"
alias tl="task list"
alias ta="task add"
# VPN
alias vUP="doas wg-quick up"
alias vDOWN="doas wg-quick down"

# Git
alias pl="git pull"
alias ph="git push"
alias sm="git switch main && git pull"
alias sn="git switch -c"


if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source # Setup shell prompt
    zoxide init fish | source # Zoxide for jump to cd command
    atuin init fish | source # Shell history
    set fish_greeting # Remove fish greeting
    cd
end

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# pnpm
set -gx PNPM_HOME "/home/bastien/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
