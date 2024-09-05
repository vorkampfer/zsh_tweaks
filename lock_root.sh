# I know I can make this shorter but it works
# Warning you can lock yourself out of your system!
# You can use the counterpart script unlock_root.sh or do it manually
# You can add bin bash comment but it isn't necessary to run
# Recommend using a zsh shell with this because when it locks the shell it assumes zsh
# Coloring lines usage
# echo -ne "${redColour}[~]${endcolour} ${yellowColour} Inject ᐅ${endColour} "\
# echo -ne "${redColour}[~]${endcolour} ${yellowColour} RCE ᐅ${endColour} "\

function ctrl_c(){
    echo -e "\n\n${redColour}[+] Exiting the function...${endColour}\n"
    exit 1
}

# Ctrl+C
trap ctrl_c SIGINT

# Global Variables
LOCKED=$(sudo head -1 /etc/shadow | cut -c 1-6 | grep --color '^.*\|$')
LOCKEDALREADY="root:!"

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

if [[ "${LOCKED}" == "${LOCKEDALREADY}" ]]; then
        echo -e "${redColour}==> [!]${endColour} ${yellowColour}ROOT is already locked.${endColour}"
else
        echo ""
fi
wait
echo

echo -e "${blueColour}The location of this script is${endColour}" $0
if [ -f "/etc/passwd" ]; then
        echo -e "${greenColour}==> [+]${endColour} ${blueColour}[+] Attempting to lock down the ROOT account...${endColour}"
        getent group root
        sudo passwd -l root
        echo -e "${greenColour}==> [+]${endColour} ${blueColour}[+] ROOT account lock was successful.${endColour}"
else
        echo "Attempt to lock ROOT account failed."
fi
wait
echo
echo
if [ -f "/etc/passwd" ]; then
        echo -e "${yellowColour}ROOT ACCOUNT${endColour} ${grayColour}LOCKED:!${endColour} ${grayColour}UNLOCKED:$ ${endColour} "
        sudo head -1 /etc/shadow | cut -c 1-6 | grep --color '^.*\|$'
else
        echo "Could not get information on Shadow File."
fi
wait
echo
echo
if [ -f "/etc/passwd" ]; then
        echo -e "${greenColour}==> [+]${endColour} ${blueColour}[+] Attempting to lock the ROOT shell...${endColour}"
        sudo usermod -s /usr/bin/nologin root
        wait
        echo -e "${greenColour}==> [+]${endColour} ${blueColour}[+] ROOT SHELL successfully locked.${endColour}"
        head -1 /etc/passwd
else
        echo "Locking the ROOT SHELL failed."
        head -1 /etc/passwd
fi
wait
echo
echo
echo
echo
if [ -f "/etc/passwd" ]; then
        echo -e "${greenColour}==> [+]${endColour} ${blueColour}Attempting to make the PASSWD file immutable...${endColour}"
        sudo chattr +i /etc/passwd
        echo -e "${blueColour}Passwd file was given the${endColour} ${yellowColour}+i${endColour} ${blueColour}attribute.${endColour}"
        lsattr /etc/passwd
else
        echo "Assigning the +i attribute to the PASSWD file failed."
        lsattr /etc/passwd
fi
wait
if [ -f "/etc/shadow" ]; then
        echo -e "${greenColour}==> [+]${endColour} ${blueColour}Attempting to make the SHADOW file immutable...${endColour}"
        sudo chattr +i /etc/shadow
        wait
        echo -e "${greenColour}==> [+]${endColour} ${blueColour}SHADOW file was given the${endColour} ${yellowColour}+i${endColour} ${blueColour}attribute.${endColour}"
        sudo lsattr /etc/shadow
else
        echo "Assigning the +i attribute to the SHADOW file failed."
        sudo lsattr /etc/shadow
fi
wait
echo
echo -e "${blueColour}This script took $SECONDS seconds to run.${endColour} "
