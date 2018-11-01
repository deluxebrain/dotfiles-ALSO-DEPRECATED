  if [[ -n "$(git config --global --includes user.name)" && \
    -n "$(git config --global --includes user.email)" ]]; then
    GIT_USERNAME="$(git config --global --includes user.name)"
    GIT_USEREMAIL="$(git config --global --includes user.email)"
  else
    GIT_USERNAME="$(user_prompt "Enter git user name")"
    GIT_USEREMAIL="$(user_prompt "Enter git email")"
  fi