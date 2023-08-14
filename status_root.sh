# This script is to be run with the other lock_root.sh script
# Run this script with root privileges. Automate and save time ;)

set -eo pipefail
echo "CHECKING THE ROOT ACCOUNT AS WELL AS ATTRIBUTES AND PERMISSIONS OF SENSITIVE FILES ON THIS MACHINE..."
sleep 3
if [ -f "/etc/passwd" ]; then
	echo "*********************************************************CHECKING WHICH ACCOUNTS HAVE SHELL ACCESS..."
	head -1 /etc/passwd; cat /etc/passwd | grep -i sh$
	echo "*********************************************************Checking ROOT GROUP..."
	getent group root
	echo "*********************************************************ROOT ACCOUNT LOCKED :! UNLOCKED :$"
	sudo head -1 /etc/shadow | cut -c 1-6
else
	echo "Could not get information on Shadow File."
fi

if [ -f "/etc/passwd" ]; then
	echo "*********************************************************Checking status of PASSWD FILE..."
	lsattr /etc/passwd; ls -lahr /etc/passwd
else
	echo "THIS IS THE STATUS OF PASSWD."
	lsattr /etc/passwd
fi

if [ -f "/etc/shadow" ]; then
	echo "*********************************************************Checking status of SHADOW FILE..."
	sudo lsattr /etc/shadow; ls -lahr /etc/shadow
else
	echo "THIS IS THE STATUS OF SHADOW."
	sudo lsattr /etc/shadow
fi
if [ -f "/etc/sudoers" ]; then
	echo "*********************************************************Checking status of SUDOERS FILE..."
	sudo lsattr /etc/sudoers; ls -lahr /etc/sudoers
else
	echo "THIS IS THE STATUS OF SUDOERS."
	lsattr /etc/passwd
fi
if [ -f "/etc/fstab" ]; then
	echo "*********************************************************Checking status of FSTAB FILE..."
	sudo lsattr /etc/fstab; ls -lahr /etc/fstab
else
	echo "THIS IS THE STATUS OF SUDOERS."
	lsattr /etc/fstab
fi

sleep 1
if [ -d "/tmp" ]; then
	echo "*********************************************************Checking what files are in the tmp folder"
	ls -lahr /tmp
else
	echo "THESE ARE THE FILES IN TMP."
	ls -lahr /tmp
fi
if [ -d "/var/tmp" ]; then
	echo "*********************************************************Checking what files are in the var tmp folder"
	ls -lahr /var/tmp
else
	echo "THESE ARE THE FILES IN TMP."
	ls -lahr /var/tmp
fi
if [ -d "/dev/shm" ]; then
	echo "*********************************************************Checking what files are in the dev shm folder"
	ls -lahr /dev/shm
else
	echo "THESE ARE THE FILES IN DEV SHM."
	ls -lahr /dev/shm
fi

if [ -d "/dev/mqueue" ]; then
	echo "*********************************************************Checking what files are in the dev mqueue"
	ls -lahr /dev/mqueue
else
	echo "THESE ARE THE FILES IN DEV MQUEUE."
	ls -lahr /dev/mqueue
fi
sleep 1
echo "**********************************************************THESE ARE ALL THE WORLD WRITABLE DIRECTORIES ON THIS MACHINE"
if [ -f "/etc/passwd" ]; then
	sudo find / -maxdepth 3 -type d -perm -777
else
	echo "THESE ARE ALL WORLD WRITABLE DIRECTORIES."
	sudo find / -maxdepth 3 -type d -perm -777
fi

if [ -f "/etc/passwd" ]; then
	echo "*********************************************************MD5 SUM HASH FOR PASSWD FILE IS..."
	echo -n /etc/passwd | md5sum
else
	echo "failed to output hash of PASSWD file."
fi

if [ -f "/etc/shadow" ]; then
	echo "*********************************************************MD5 SUM HASH FOR SHADOW FILE IS..."
	echo -n /etc/shadow | md5sum
else
	echo "failed to output hash of SHADOW file."
fi
if [ -f "/etc/sudoers" ]; then
	echo "*********************************************************MD5 SUM HASH FOR SUDOERS FILE IS..."
	echo -n /etc/sudoers | md5sum
else
	echo "failed to output hash of SUDOERS file."
fi
if [ -f "/etc/pacman.conf" ]; then
	echo "*********************************************************MD5 SUM HASH FOR PACMAN.CONF FILE IS..."
	echo -n /etc/pacman.conf | md5sum
else
	echo "failed to output hash of pacman.conf file."
fi
