export PYENV_ROOT="$HOME/.pyenv"

# Used for python packages when using pip --user
PATH="$HOME/.local/bin:$PATH"
PATH="$PYENV_ROOT/bin:$PATH"

# Note this should be at the end of .profile (or equivalent)
# See: https://github.com/pyenv/pyenv/issues/264
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"
pyenv virtualenv --version >/dev/null 2>&1 && \
    eval "$(pyenv virtualenv-init -)"
