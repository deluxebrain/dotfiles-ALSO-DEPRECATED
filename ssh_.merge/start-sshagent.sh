#!/usr/bin/env bash

# check if ssh-agent is running
# exit code of 2 is an actual error
ssh-add -l &> /dev/null
(( "$?" != 2 )) && return

[ -r "$HOME/.ssh/.ssh-agent" ] \
    && eval "$(< "$HOME/.ssh/.ssh-agent")" > /dev/null

ssh-add -l &> /dev/null
(( "$?" != 2 )) && return

# scope the umask to the command using a subshell
(umask 066; ssh-agent > "$HOME/.ssh/.ssh-agent")
eval "$(< "$HOME/.ssh/.ssh-agent")" > /dev/null
ssh-add

# setup trap to kill ssh-agent on shell exit
# note that SSH_AGENT_PID is not set for system ssh-agent
# so this will only kill shell launched agents
trap 'kill $SSH_AGENT_PID' EXIT
