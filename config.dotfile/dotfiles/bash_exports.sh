# Exports

# Location of xdg compliant configuration files
# e.g. Powerline and these dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# History
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=10000

# Make vim the default editor
export EDITOR="vim"

# Language preferences
export LANG="en-GB"
export LC_ALL="en_GB.UTF-8"

# Dont clear the screen after quitting a man page
export MANPAGER="less -X"

# Increase NODE repl history
export NODE_REPL_HISTORY_SIZE=10000

# Set Python to use UTF-8 encoding for stdout/stdin/stderr
export PYTHONIOENCODING="UTF-8"

# Path
PATH="$HOME/bin:$PATH"
