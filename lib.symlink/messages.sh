[ -z "${__MESSAGES__+.}" ] && readonly __MESSAGES__= || return 0

source "`dirname "${BASH_SOURCE[0]}"`/pens.sh"

function msg_info()
{
  printf " [ %sINFO%s ] %s\n" "${PEN_INFO}" "${PEN_RESET}" "$1"
}

function msg_debug()
{
  printf " [ %sDEBUG%s ] %s\n" "${PEN_DEBUG}" "${PEN_RESET}" "$1"
}

function msg_prompt()
{
  printf " [ %s???%s ] %s\n" "${PEN_INFO}" "${PEN_RESET}" "$1"
}

function msg_ok()
{
  printf " [ %sOK%s ] %s\n" "${PEN_OK}" "${PEN_RESET}" "$1"
}

function msg_warn()
{
  printf " [ %sWARNING%s ] %s\n" "${PEN_WARN}" "${PEN_RESET}" "$1" >&2
}

function msg_error()
{
  printf " [ %sERROR%s ] %s\n" "${PEN_ALERT}" "${PEN_RESET}" "$1" >&2
}

# Pause execution until user confirms ( any response )
# Arguments:
# Returns:
function prompt_pause()
{
  read -r -p "`msg_prompt "Hit enter to continue"` "
}

# Prompt user for confirmation
# Arguments:
#   $1: User message
# Returns:
#   0: Y
#   1: N
function prompt_confirm()
{
  local message="$1" 
  while ! [[ $REPLY =~ ^[YyNn]$ ]]; do
    read -r -p "`msg_prompt "$message (y/n)"` "
  done
  [[ $REPLY =~ ^[Yy]$ ]]
}

# Prompt user for (non-blank) response
# Arguments:
#   $1: User message
# Returns:
#   stdout: User response
function prompt_question()
{  
  local message="$1" 
  while [ -z "${REPLY// /}" ]; do
    read -r -p "${message}: "
  done
  echo "$REPLY"
}

# Display error message and exit 1
# Arguments:
#   $1: User message
# Returns:
#   ( exit 1)
function fail()
{
  printf " [ %sFAIL%s ] %s\n" "${PEN_ALERT}" "${PEN_RESET}" "$1" >&2
  exit 1
}
