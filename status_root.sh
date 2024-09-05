#!/bin/bash
# Run this script with root privileges. Automate and save time


function ctrl_c(){
    echo -e "\n\n${redColour}[+] Exiting the function...${endColour}\n"
    exit 1
}

# Ctrl+C
trap ctrl_c SIGINT

# Global Variables

set -o ignoreeof
# export the variable so it takes 42 times to close using ctrl+d
export IGNOREEOF=42

# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


#set -eo pipefail
if [ -f /home/shadow42/bashscr1pt1ng/neofetch_version_kernel.sh ]; then
        /home/shadow42/bashscr1pt1ng/neofetch_version_kernel.sh
fi
sleep 2
echo -e "${yellowColour}CHECKING THE ROOT ACCOUNT AS WELL AS ATTRIBUTES AND PERMISSIONS OF SENSITIVE FILES ON THIS MACHINE.${endColour}\n"
sleep 1
echo
echo
if [ -f "/etc/passwd" ]; then
        echo -e "${yellowColour}CHECKING WHICH ACCOUNTS HAVE SHELL ACCESS...${endColour}"
        head -1 /etc/passwd; cat /etc/passwd | grep -i sh$
        echo -e "${yellowColour}Checking ROOT GROUP...${endColour} "
        getent group root
        echo -e "${yellowColour}ROOT ACCOUNT${endColour} ${grayColour}LOCKED:!${endColour} ${grayColour}UNLOCKED:$ ${endColour} "
        sudo head -1 /etc/shadow | cut -c 1-6 | grep --color '^.*\|$'
else
        echo "Could not get information on Shadow File."
fi
echo
echo
echo
if [ -f "/etc/passwd" ]; then
        echo -e "${yellowColour}Checking status of PASSWD FILE...${endColour} "
        lsattr /etc/passwd
        /usr/bin/getfacl /etc/passwd 2>/dev/null
else
        echo "THIS IS THE STATUS OF PASSWD."
        lsattr /etc/passwd
fi
echo
if [ -f "/etc/shadow" ]; then
        echo -e "${yellowColour}Checking status of SHADOW FILE...${endColour} "
        sudo lsattr /etc/shadow
        wait
        sudo /usr/bin/getfacl /etc/shadow 2>/dev/null
        wait
else
        echo "THIS IS THE STATUS OF SHADOW."
        sudo lsattr /etc/shadow
fi
echo
if [ -f "/etc/gshadow" ]; then
        echo -e "${yellowColour}Checking status of GSHADOW FILE...${endColour} "
        sudo cat /etc/gshadow | grep root
        sudo lsattr /etc/gshadow
        wait
        sudo /usr/bin/getfacl /etc/gshadow 2>/dev/null
        wait
        echo
else
        echo "THIS IS THE STATUS OF SHADOW."
        sudo lsattr /etc/gshadow
fi
echo
if [ -f "/etc/sudoers" ]; then
        echo -e "${yellowColour}Checking status of SUDOERS FILE...${endColour} "
        sudo lsattr /etc/sudoers
        sudo /usr/bin/getfacl /etc/sudoers 2>/dev/null
else
        echo "Not sure what happened with listing sudoers file."
fi
echo
if [ -f "/etc/fstab" ]; then
        echo -e "${yellowColour}Checking status of FSTAB FILE...${endColour} "
        sudo lsattr /etc/fstab
        sudo /usr/bin/getfacl /etc/fstab 2>/dev/null
else
        echo "THIS IS THE STATUS OF SUDOERS."
        lsattr /etc/fstab
fi
echo
echo
sleep 1
if [ -d "/tmp" ]; then
        echo -e "${yellowColour}Checking what files are in the tmp folder${endColour} "
        ls -lahr /tmp
else
        echo "THESE ARE THE FILES IN TMP."
        ls -lahr /tmp
fi
if [ -d "/var/tmp" ]; then
        echo -e "${yellowColour}Checking what files are in the var tmp folder${endColour} "
        ls -lahr /var/tmp
else
        echo "THESE ARE THE FILES IN TMP."
        ls -lahr /var/tmp
fi
if [ -d "/dev/shm" ]; then
        echo -e "${yellowColour}Checking what files are in the dev shm folder${endColour} "
        ls -lahr /dev/shm
else
        echo "THESE ARE THE FILES IN DEV SHM."
        ls -lahr /dev/shm
fi

if [ -d "/dev/mqueue" ]; then
        echo -e "${yellowColour}Checking what files are in the dev mqueue${endColour} "
        ls -lahr /dev/mqueue
else
        echo "THESE ARE THE FILES IN DEV MQUEUE."
        ls -lahr /dev/mqueue
fi
echo
echo
echo
echo
echo
sleep 1
echo -e "${redColour}These are all the world writable directories on this machine.${endColour} "
if [ -f "/etc/passwd" ]; then
        sudo find / -maxdepth 3 -type d -perm -777 2>/dev/null
else
        echo "ERROR: These are all the world writable directories."
        sudo find / -maxdepth 3 -type d -perm -777
fi
echo
echo
echo
echo
if [ -f "/etc/passwd" ]; then
        echo -e "${yellowColour}MD5 SUM HASH FOR PASSWD FILE IS...${endColour}"
        echo -n /etc/passwd | md5sum
else
        echo "failed to output hash of PASSWD file."
fi

if [ -f "/etc/shadow" ]; then
        echo -e "${yellowColour}MD5 SUM HASH FOR SHADOW FILE IS...${endColour} "
        echo -n /etc/shadow | md5sum
else
        echo "failed to output hash of SHADOW file."
fi
if [ -f "/etc/sudoers" ]; then
        echo -e "${yellowColour}MD5 SUM HASH FOR SUDOERS FILE IS...${endColour} "
        echo -n /etc/sudoers | md5sum
else
        echo "failed to output hash of SUDOERS file."
fi
if [ -f "/etc/pacman.conf" ]; then
        echo -e "${yellowColour}MD5 SUM HASH FOR PACMAN.CONF FILE IS...${endColour} "
        echo -n /etc/pacman.conf | md5sum
else
        echo "failed to output hash of pacman.conf file."
fi

if [ -f "/home/pepe/wackdab0x/rockyou.txt.tar.gz" ]; then
        echo -e "${yellowColour}MD5 SUM HASH FOR rockyou.txt.tar.gz FILE IS...${endColour} "
        echo -n /home/pepe/wackdab0x/rockyou.txt.tar.gz | md5sum
else
        echo "failed to output hash of rockyou.txt.tar.gz file. Is the file missing?"
fi

echo -e "${blueColour}This script took $SECONDS seconds to run.${endColour} "
