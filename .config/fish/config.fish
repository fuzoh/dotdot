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
#set -gx QT_QPA_PLATFORM wayland-egl
set -gx ELM_DISPLAY wl
set -gx SDL_VIDEODRIVER wayland
# Electron wayland flag
set -gx ELECTRON_OZONE_PLATFORM_HINT wayland

set -gx GPG_TTY (tty)

set -gx JAVA_HOME /usr/lib/jvm/default-jdk

set -gx XDEB_PKGROOT ~/.config/xdeb


# Add some variables to path
#fish_add_path -aP ~/.cargo/bini
source "$HOME/.cargo/env.fish"
fish_add_path -aP ~/.npm-global/bin
fish_add_path -aP ~/.bin
fish_add_path -aP ~/.local/bin
fish_add_path -aP ~/flutter/bin
fish_add_path -aP ~/go/bin
fish_add_path -aP "$JAVA_HOME/bin"

# Start ssh agent
fish_ssh_agent

# Some aliases
alias ls="eza"
alias ll="eza --long --git --all"
alias lt="eza --tree --level=2 --long --git"
abbr -a sail "./vendor/bin/sail"
abbr -a artisan "php artisan"
abbr -a pint "./vendor/bin/pint"
abbr -a t task
alias ip="ip --color=auto"
abbr -a pgc "pass generate -c"
abbr -a pgns "pass generate -c --no-symbols"
abbr -a gui gitui
abbr -a lg lazygit
abbr -a tl "task list"
abbr -a ta "task add"
# VPN
abbr -a vUP "doas wg-quick up"
abbr -a vDOWN "doas wg-quick down"

# Git
abbr -a cm "git commit -m"
abbr -a pl "git pull"
abbr -a ph "git push"
abbr -a sm "git switch main && git pull"
abbr -a sn "git switch -c"

abbr -a dup "docker compose up"
abbr -a ddown "docker compose down"

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source # Setup shell prompt
    zoxide init fish | source # Zoxide for jump to cd command
    atuin init fish | source # Shell history
    tv init fish | source # Tv autocomplete
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
