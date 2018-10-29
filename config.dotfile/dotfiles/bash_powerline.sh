export POWERLINE_BASH_CONTINUATION=1
export POWERLINE_BASH_SELECT=1

command -v powerline-daemon >/dev/null 2>&1 || return
powerline-daemon -q
source "/usr/share/powerline/bindings/bash/powerline.sh"
