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
# LANG sets the locale in the absence of LC_ALL
export LANG="en-GB.UTF-8"

# Dont clear the screen after quitting a man page
export MANPAGER="less -X"

# Increase NODE repl history
export NODE_REPL_HISTORY_SIZE=10000

# Set Python to use UTF-8 encoding for stdout/stdin/stderr
export PYTHONIOENCODING="UTF-8"

# nvm
export NVM_DIR="$HOME/.nvm"

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"

# Path
PATH="$HOME/bin:$PATH"
PATH="$PYENV_ROOT/bin:$PATH"
# Used for python packages when using pip --user
PATH="$HOME/.local/bin:$PATH"
