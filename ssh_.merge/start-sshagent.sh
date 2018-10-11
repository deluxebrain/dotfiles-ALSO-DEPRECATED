#!/bin/bash

SSH_ENV="$HOME/.ssh/.ssh-agent"

# setup trap to kill ssh-agent on shell exit
# note that SSH_AGENT_PID is not set for system ssh-agent,
# so this will only kill shell launched agents
trap 'kill $SSH_AGENT_PID' EXIT

# check if ssh-agent is running
# exit code of 2 is an actual error
ssh-add -l &>/dev/null
(( "$?" != 2 )) && return

# Resume existing session
[ -f "$SSH_ENV" ] && source "$SSH_ENV" >/dev/null

# Check if the ssh-agent is now running
ssh-add -l &>/dev/null
(( "$?" != 2 )) && return

# Create a new ssh-agent session
echo "Starting new SSH agent ..." >&2
ssh-agent > "$SSH_ENV"
chmod 600 "$SSH_ENV"
source "$SSH_ENV" >/dev/null
ssh-add >/dev/null
