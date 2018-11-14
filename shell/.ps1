# colors
BLUE="\[\e[34m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
RESET="\[\033[m\]"

# things
DATE="\d"
TIME="\t"
DIR="\w"
NEWLN="\n"

PS1="${NEWLN}${BLUE}${DATE} ${TIME} ${GREEN}${DIR}${YELLOW}\$(__git_ps1)${NEWLN}${GREEN}\$${RESET} "
PS2="${GREEN}>${RESET} "
