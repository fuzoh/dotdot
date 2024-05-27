# Variables initialisation
# Config directories
set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_DATA_HOME ~/.local/share
#set -gx XDG_RUNTIME_DIR /run/user/1000

set -gx LIBVA_DRIVER_NAME radeonsi
set -gx VDPAU_DRIVER radeonsi

# Some varables to help apps to corectly use wayland
set -gx MOZ_ENABLE_WAYLAND 1
set -gx QT_QPA_PLATFORM wayland-egl
set -gx ELM_DISPLAY wl
set -gx SDL_VIDEODRIVER wayland

set -gx GPG_TTY (tty)

# Add some variables to path
#fish_add_path -aP ~/.cargo/bini
source "$HOME/.cargo/env.fish"
fish_add_path -aP ~/.npm-global/bin
fish_add_path -aP ~/.bin

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

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    set fish_greeting
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
