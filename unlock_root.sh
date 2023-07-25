# This script is to be run with the other lock_root.sh script
# Run this script with root privileges. Automate and save time ;)



if [ -f "/etc/passwd" ]; then
	echo "Attempting to remove IMMUTABLE attributes from PASSWD file."
	sudo chattr = /etc/passwd
	echo "Passwd file IMMUTABLE attribute successfully removed."
	lsattr /etc/passwd
else
	echo "Remvoving IMMUATABLE attribute failed. Please do this manually."
	lsattr /etc/passwd
fi

if [ -f "/etc/shadow" ]; then
	echo "Attempting to remove the IMMUTABLE attribute from the SHADOW file..."
	sudo chattr = /etc/shadow
	echo "SHADOW file IMMUTABLE attribute successfully removed."
	sudo lsattr /etc/shadow
else
	echo "Removing the IMMUTABLE attribute from the SHADOW file failed."
	sudo lsattr /etc/shadow
fi

if [ -f "/etc/passwd" ]; then
	echo "Attempting to UNLOCK the ROOT account..."
	sudo passwd -u root
	echo "ROOT account was successfully UNLOCKED!"
else 	
	echo "Attempt to UNLOCK ROOT account failed. You will have to unlock root manually."
fi

if [ -f "/etc/passwd" ]; then
	echo "Attempting to UNLOCK the ROOT SHELL..."
	sudo usermod -s /usr/bin/zsh root
	echo "ROOT SHELL successfully UNLOCKED!"
	head -1 /etc/passwd
else
	echo "Unlocking the ROOT SHELL failed. Please do this manually."
	head -1 /etc/passwd
fi




