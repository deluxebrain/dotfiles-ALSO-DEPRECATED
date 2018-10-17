[ -z "${__MESSAGES__+.}" ] && readonly __MESSAGES__= || return 0
source ~/lib/pens.sh

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

function fail()
{
  printf " [ %sFAIL%s ] %s\n" "${PEN_ALERT}" "${PEN_RESET}" "$1" >&2
  exit 1
}

