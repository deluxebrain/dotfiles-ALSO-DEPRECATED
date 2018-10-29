# PROMPT_COMMAND must be set before configuring Powerline
export PROMPT_COMMAND=__PROMPT_COMMAND_NVM

# Uses the nvm provided `nvm_find_nvmrc` function to find the .nvmrc file in scope
__NVM_DIRTY=false
function __PROMPT_COMMAND_NVM()
{
    local nvmrc_path="$(nvm_find_nvmrc)"
    local node_version nvmrc_node_version

    if [ -z "$nvmrc_path" ]; then
        # Return early if no work todo
        ! $__NVM_DIRTY && return
        nvm use default
        __NVM_DIRTY=false
    else
        # In a node project
        __NVM_DIRTY=true
        node_version="$(nvm version)"
        nvmrc_node_version="$(nvm version "$(cat "$nvmrc_path")")"
        if [ "$nvmrc_node_version" = "N/A" ]; then
            # Specificed node version is not installed locally
            nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm use
        fi
    fi
}

[ -d "$NVM_DIR" ] || return
[ -f "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -f "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
