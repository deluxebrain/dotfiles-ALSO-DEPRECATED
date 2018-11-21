export DOTFILES_VERSION="1.0"

# Location of xdg compliant configuration files
# e.g. Powerline and these dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

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
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# Configure Pipenv to integrate with PyEnv to determine Python version
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
# Set Python to use UTF-8 encoding for stdout/stdin/stderr
export PYTHONIOENCODING="UTF-8"
