#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|
#

# This configuration is vastly inspired by the one from unixsheikh
# https://unixsheikh.com/tutorials/how-to-setup-freebsd-with-a-riced-desktop-part-1-basic-setup.html

#--------------------#
# Bootstraping
#--------------------#

# If not running interactively, don't do anything.
if [[ $- != *i* ]] ; then
    return
fi

#--------------------#
# Basic setup
#--------------------#

# I prefer less to more.
export PAGER=less
export MANPAGER=less

# I prefer to set both EDITOR and VISUAL to Vim or Neovim.
export EDITOR=hx
export VISUAL=hx

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
HISTSIZE=10000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [[ -n $force_color_prompt ]]; then
    if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
            color_prompt=yes
    else
            color_prompt=
    fi
fi

# Set a default prompt.
PS1='\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[01;36m\]\h \[\033[01;33m\]\w \[\033[01;35m\]\$ \[\033[00m\]'

# Uncomment if you want to try an advanced prompt.
#PS1="\[\e[0;34m\]┌─[\[\e[1;33m● \h\e[0;34m\]]─[\[\e[1;36m\u\e[0;34m\]]─[\e[1;37m\w\e[0;34m]─\[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\A\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]$_EXIT_STATUS_STR: \$\[\e[0;34m\]\n\[\e[0;34m\]└─╼ \[\e[1;35m\]>> \[\e[00;00m\]"

# Enable Bash completion.
if [[ -f /usr/local/share/bash-completion/bash_completion.sh ]]; then
    source /usr/local/share/bash-completion/bash_completion.sh
fi

#--------------------#
# Aliases
#--------------------#

source ~/.aliases

#export XDG_RUNTIME_DIR=/var/run/user/`id -u`
export XDG_CONFIG_HOME=~/.config
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland-egl
export ELM_DISPLAY=wl
export SDL_VIDEODRIVER=wayland

export GPG_TTY=$(tty)

# Path update
#PATH=$PATH:~/.cargo/bin
#PATH=$PATH:~/.npm-global/bin
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

source /home/bastien/.config/broot/launcher/bash/br
. "/home/bastien/.deno/env"