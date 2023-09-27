#!/bin/bash
# Works on Arch based distros only
# Simple 1 liner used with grep. I if you have autosuggestion this makes searching for packages really easy
# Instead of remembering the long file name. I tried doing this as an alias doesn't work for some reason.
# Usage: ./pkgsearch | grep -i "package name"
LC_ALL=C pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
