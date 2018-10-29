# Note this should be at the end of .profile (or equivalent)
# See: https://github.com/pyenv/pyenv/issues/264
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"
pyenv virtualenv --version >/dev/null 2>&1 && \
    eval "$(pyenv virtualenv-init -)"
