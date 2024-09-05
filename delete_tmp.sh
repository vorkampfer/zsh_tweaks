#!/bin/bash
# I know I can make this shorter but it works
# Safely delete the common world writable directories

function ctrl_c(){
    echo -e "\n\n${redColour}[+] You have exited the delete temp files script...${endColour}\n"
    exit 1
}

# Ctrl+C
trap ctrl_c SIGINT

# Global Variables


# Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

echo -e "${blueColour}The location of this script is${endColour}" $0
echo -e "${blueColour}Just press 'CTRL + c' to terminate script early. ${endColour}"
echo

if [ -d "/tmp" ] && [ -w "/tmp" ]; then
        echo "Attempting to delete all tmp files..."
        sudo rm -rf /tmp/*
else
        echo "Not all files were deleted in tmp."
fi

if [ -d "/var/tmp" ] && [ -w "/var/tmp" ]; then
        echo "Attempting to delete all var tmp files..."
        sudo rm -rf /var/tmp/*
        echo "listing files in var temp."
        ls -lahr /var/tmp
else
        echo "Not all files were deleted in var tmp."
        ls -lahr /var/tmp
fi

if [ -d "/dev/shm" ] && [ -w "/dev/shm" ]; then
        echo "Attempting to delete all dev shm files..."
        sudo rm -rf /dev/shm/*
        echo "listing files in dev shm."
        ls -lahr /dev/shm
else
        echo "Not all files were deleted in dev shm."
        ls -lahr /dev/shm
fi

if [ -d "/tmp" ] && [ -w "/tmp" ]; then
        echo "hunting for stragglers in tmp..."
        rm -rf /tmp/*.xfsm
        sudo rm -rf /tmp/.X0-lock
        rm -rf /tmp/*
        echo "listing remaining straggler files in tmp"
        ls -lahr /tmp
else
        echo "Not able to delete all stragglers in tmp"
        ls -lahr /tmp
fi

if [ -d "/tmp" ] && [ -w "/tmp" ]; then
        echo "Attempting to delete all leftover tmp files..."
        sudo rm -rf /tmp/.X0-lock
        sudo rm -rf /tmp/.xfsm-ICE*
        echo "The files with .UNIX extension are system files which should not be deleted."
        ls -lahr /tmp
else
        echo "Not all files were deleted in tmp."
        ls -lahr /tmp
fi
