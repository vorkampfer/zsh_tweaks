# zsh_tweaks
This is my .zshrc files as well some bash scripts on tweaks to improve your terminal life using zsh and bash. Applies to Debian/Ubuntu/Arch distros.
This is very basic bash scripts anyone can write, but I find them useful so I am adding them here for public use. Enjoy make better version etc...

### How to execute bash scripts from anywhere in a secure method to automate life in the terminal. Of course, the word 'secure' is a loaded term. So be careful.  
### Security is up to the end user. I am not responsible if you break you install.
## WARNING: The lock_root.sh script can lock you out of your computer if you don't understand how it works. Also if you lose your passwords good luck trying to get back in your system.
### Usage:
1. To use the scripts simply download them or copy the raw to file_name.sh
2. add the folder you store these bash scripts in to your $PATH
3. For example add the to the bottom of your ~/.bashrc or ~/.zshrc file the following command
4. $ export PATH="$PATH:/home/user/mybash_directory"
5. $ You need to give the bash executable permissions, and then they can be run from anywhere in the terminal.
6. I recommend $ chmod 744 files.sh because any higher permissions is not necessary
7. You can always cd into the folder you are keeping the scripts and run with ./hgrep.sh for example

### hgrep.sh usage
1. You can run it with ./hgrep.sh | grep -i myword, or just with $ hgrep.sh | grep -i myword by enabling $PATH as explained above.
2. What is the point of this stupid script? Well, type cat ~/.zsh_history is a pain to me and this just saves a few seconds of time which can add up.
3. I am sure there are better ways to do this or even way better packages but this works for me and I hope someone finds it useful as well.

### delete__tmp.sh usage
1. Just as the name implies.This is a super simple if else script to automate your terminal life.
2. Delete those pesky /tmp files that seem very sus easily.

### delete_if_tmp.sh usage
1. Same as the one above except it deletes everything from the 3 most common world writable directories in Debian/Ubuntu
2. /tmp /var/tmp and /dev/shm, there are many more but these are safe to delete the junk files. Bleachbit is way better of course.

### lock_root.sh
1. This bash script can be very usefull. Must be run as root. Recommend to cd into the directory and run it with root@debian:~# ./lock_root.sh
2. It is locking the root account, locking the root shell, assigning the chattr +i to /etc/passwd and /etc/shadow to make them immutable
3. This is a script for the paranoid like me, or if you want that extra lockdown layer of security.
4. Of course this is a pain because when you need to do upgrades APT may complain about not being able to install upgrades or install packages.
5. You will have to undo the 4 things that it did with the following commands.
6. $ sudo chattr = /etc/passwd
7. $ sudo chattr = /etc/shadow
8. $ sudo passwd -u root
9. To unlock the root shell again you will have to edit the /etc/passwd manually and remove /usr/bin/nologin and replace with /usr/bin/zsh or /bin/bash if your using a bash terminal.
10. I know that would be a pain and I will upload shortly an unlock.sh to run if you want to unlock what the lock_root.sh did.

### unlock_root.sh
1. This file is the counterpart to the lock_root.sh. Simply run this script when you want to unlock the above mentioned files.
2. Usage: just type unlock_root.sh in the terminal, if in $PATH, or cd into the directory where you have the script and type: root@debian:~# ./unlock_root.sh
##### You can send me your Github link or inquires to francescoppolla@protonmail.com
    


   
 

