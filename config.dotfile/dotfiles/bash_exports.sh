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
# Set Python to use UTF-8 encoding for stdout/stdin/stderr
export PYTHONIOENCODING="UTF-8"
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
# pyenv-virtualenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# Configure Pipenv to integrate with PyEnv to determine Python version
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

# Ruby
# rbenv
export RBENV_ROOT="$HOME/.rbenv"

# NodeJS
# nodenv
export NODENV_ROOT="$HOME/.nodenv"

# Go
export GOPATH="$HOME/go"

# History
export HISTSIZE=10000
export HISTFILESIZE=10000
# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL='ignoreboth'
# set list of commands to ignore in history
export HISTIGNORE='ls:bg:fg:history'
# timestamp all history entries
export HISTTIMEFORMAT='%F %T '

# Path
# User level scripts
export PATH="$HOME/bin:$HOME/lib:$PATH"

# Path::Python
# pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
# pip
# Resolve $HOME/.local/bin/pip ahead of /usr/bin/pip
# Resolve packages installed using pip --user
export PATH="$HOME/.local/bin:$PATH"

# Path::Ruby
# rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
# Enable use of Gem from system Ruby
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# Path::NodeJS
# nodenv
export PATH="$NODENV_ROOT/bin:$PATH"

# Path::Go
export PATH="$PATH:/usr/local/go/bin"
