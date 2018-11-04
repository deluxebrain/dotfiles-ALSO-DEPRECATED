# setup trap to kill ssh-agent on shell exit
# note that SSH_AGENT_PID is not set for system ssh-agent,
# so this will only kill shell launched agents
trap 'ssh-agent -k >/dev/null 2>&1' EXIT

# check if ssh-agent is running
[ -n "$SSH_AGENT_PID" ] && \
    ps -p "$SSH_AGENT_PID" > /dev/null && \
    return

# Create a new ssh-agent session
eval `ssh-agent -s` >/dev/null  2>&1

# Load keys
ssh-add "$HOME/.ssh/id_ed25519_default" >/dev/null 2>&1
