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

# Dont clear the screen after quitting a man page
export MANPAGER="less -X"

# NodeJS
# nvm
export NVM_DIR="$HOME/.nvm"
# Increase NODE repl history
export NODE_REPL_HISTORY_SIZE=10000

# Python
# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
# Configure Pipenv to integrate with PyEnv to determine Python version
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
# Set Python to use UTF-8 encoding for stdout/stdin/stderr
export PYTHONIOENCODING="UTF-8"

# Path
PATH="$HOME/bin:$PATH"
PATH="$PYENV_ROOT/bin:$PATH"
# Used for python packages when using pip --user
PATH="$HOME/.local/bin:$PATH"
