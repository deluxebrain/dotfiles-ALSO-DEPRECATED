# Note that RVM requires that the PATH is not changed following it being sourced

# Add RVM sourcing line to allow RVM to affect current user environment
# Load RVM into a shell session *as a function*
# ( RVM Binary Mode Vs Function Mode
# https://rvm.io/workflow/scripting )

if [ -f "$HOME/.rvm/scripts/rvm" ] ; then
  # First try to load from a user install  
  source "$HOME/.rvm/scripts/rvm"
elif [ -f "/usr/local/rvm/scripts/rvm" ] ; then
  # Then try to load from a root install 
  source "/usr/local/rvm/scripts/rvm"
elif [ -f "/usr/share/rvm/scripts/rvm" ] ; then
  # Then try to load from an ubuntu install 
  source "/usr/share/rvm/scripts/rvm"
else
  echo "ERROR: An RVM installation was not found." >&2
  exit 1
fi
