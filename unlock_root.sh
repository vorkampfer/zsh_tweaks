#!/bin/bash
# This script is to be run with the other lock_root.sh script
# Run this script with root privileges. Automate and save time ;)
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
        echo -e "${grayColour}Unlocking...${endColour}"
else
        echo -e "${redColour}==> [!]${endColour} ${yellowColour}ROOT is already unlocked.${endColour}"
fi
wait
echo
echo -e "${blueColour}The location of this script is${endColour}" $0
echo -e "${redColour}UNLOCKING ROOT AND SENSITIVE FILES${endColour}"
echo
echo
echo
if [ -f "/etc/passwd" ]; then
        echo -e "${yellowColour}ROOT ACCOUNT${endColour} ${grayColour}LOCKED:!${endColour} ${grayColour}UNLOCKED:$ ${endColour} "
        sudo head -1 /etc/shadow | cut -c 1-6 | grep --color '^.*\|$'
        echo -e "${greenColour}ROOT ACCOUNT IS CURRENTLY LOCKED. UNLOCKING THE ROOT ACCOUNT.${endColour}"
else
        echo -e "${grayColour}Could not get information on Shadow File.${endColour}"
fi
wait
echo
echo
if [ -f "/etc/passwd" ]; then
        echo -e "${yellowColour}Attempting to remove IMMUTABLE attributes from PASSWD file.${endColour}"
        sudo chattr = /etc/passwd
        echo -e "${yellowColour}Passwd file IMMUTABLE attribute successfully removed.${endColour}"
        lsattr /etc/passwd
else
        echo -e "${grayColour}Remvoving IMMUATABLE attribute failed. Please do this manually.${endColour}"
        lsattr /etc/passwd
fi
wait

if [ -f "/etc/shadow" ]; then
        echo -e "${yellowColour}Attempting to remove the IMMUTABLE attribute from the SHADOW file...${endColour}"
        sudo chattr = /etc/shadow
        echo -e "${yellowColour}SHADOW file IMMUTABLE attribute successfully removed.${endColour}"
        sudo lsattr /etc/shadow
else
        echo -e "${grayColour}Removing the IMMUTABLE attribute from the SHADOW file failed.${endColour}"
        sudo lsattr /etc/shadow
fi
wait
echo
echo
if [ -f "/etc/passwd" ]; then
        echo -e "${grayColour}Attempting to UNLOCK the ROOT account...${endColour}"
        sudo passwd -u root
        echo -e "${grayColour}ROOT account was successfully UNLOCKED!${endColour}"
else
        echo -e "${grayColour}Attempt to UNLOCK ROOT account failed. You will have to unlock root manually.${endColour}"
fi
wait

if [ -f "/etc/passwd" ]; then
        echo -e "${grayColour}Attempting to UNLOCK the ROOT SHELL...${endColour}"
        sudo usermod -s /usr/bin/zsh root
        echo -e "${grayColour}ROOT SHELL successfully UNLOCKED!${endColour}"
        head -1 /etc/passwd
else
        echo -e "${grayColour}Unlocking the ROOT SHELL failed. Please do this manually.${endColour}"
        head -1 /etc/passwd
fi
wait
if [ -f "/etc/passwd" ]; then
        echo -e "${grayColour}Root successfully unlocked if you see:${endColour} ${redColour}root:$ ${endColour}"
        sudo head -1 /etc/shadow | cut -c 1-6 | grep --color '^.*\|$'
else
        echo -e "${grayColour}Could not get information on Shadow File.${endColour}"
fi
wait
echo -e "${blueColour}This script took $SECONDS seconds to run.${endColour} "
