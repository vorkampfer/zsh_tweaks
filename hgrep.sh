


RED='\033[0;31m'
NC='\033[0m' # No Color

printf "NOW ${RED}SEARCHING... ${NC}ZSH_HISTORY_FILE \n"

if [ -f "/home/pab10x/.zsh_history" ]; then
	echo "Searching zsh history ........."
	cat /home/pab10x/.zsh_history
fi

