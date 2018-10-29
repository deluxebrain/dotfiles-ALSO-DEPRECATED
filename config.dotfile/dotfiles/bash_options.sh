shopt -s expand_aliases

# Check window size after each command and update LINES
# and COLUMNS if necessary
shopt -s checkwinsize

# Automatically prepend cd to directory names
shopt -s autocd

# autocorrect typos in path when using `cd`
shopt -s cdspell

# case insensitive globbing
shopt -s nocaseglob

# Perform recursive globbing on `**`, e.g:
# find . -type f -name "*.py" -print0 | xargs -0 cat | wc -l
# becomes this:
# wc **/*.py -l
shopt -s globstar

# append to history file ( instead of overwriting )
shopt -s histappend 

# save all lines of a multiline command to same history entry
shopt -s cmdhist
