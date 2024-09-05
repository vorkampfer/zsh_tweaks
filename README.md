# zsh_tweaks
Here are some zsh bash scripts on tweaks to improve my terminal life using zsh and bash. Applies to Arch distros, but will probrably work on Debian as well.
This is very basic bash scripts anyone can write, but I find them useful so I am adding them here for public use. Enjoy make better versions etc...

### How to execute bash scripts from anywhere in a secure method to automate life in the terminal. Of course, the word 'secure' is a loaded term. So be careful.  
### Security is up to the end user. I am not responsible if you break you install.

## WARNING: The lock_root.sh script can lock you out of your computer if you don't understand how it works. Also if you lose your passwords and you ran lock_root.sh good luck trying to get back in your system. So just make sure you have your passwords.

### Usage:
1. To use the scripts simply download them or copy the raw to file_name.sh
2. add the folder you store these bash scripts in to your $PATH
3. For example add the to the bottom of your ~/.bashrc or ~/.zshrc file the following command
4. $ export PATH="$PATH:/home/user/my_bash_scripts_directory"
5. $ You need to give the bash executable permissions, and then they can be run from anywhere in the terminal.
6. I recommend $ chmod 744 files.sh because any higher permissions is not necessary
7. You can always cd into the folder you are keeping the scripts and run with ./unlock_root.sh for example

### hgrep.sh usage
1. You can run it with ./hgrep.sh | grep -i myword, or just with $ hgrep.sh | grep -i myword by enabling $PATH as explained above.
2. With this one you don't really need a bash script you can just create and alias (alias hgrep='cat ~/.zsh_history | grep -i') So you just need to type $ hgrep search_term

### status_root.sh
1. I like this bash script because it is doing many commands that I just don't have the time to be doing all the time.
2. It is just a status check using ls,lsattr, and regex to see if root is locked, if the shell is locked, who has shell access in /etc/passwd, What permissions you have on important files like /etc/shadow etc., what tmp files you have, and what world writable directories are on your computer.
3. It is basically a file monitoring script that I will be improving upon later.

### delete__tmp.sh usage
1. Just as the name implies.This is a super simple if else script to automate your terminal life.
2. Delete those pesky /tmp files that seem very sus easily.

### delete_if_tmp.sh usage
1. Same as the one above except it deletes everything from the 3 most common world writable directories in Debian/Ubuntu
2. /tmp /var/tmp and /dev/shm, there are many more but these are safe to delete the junk files. Bleachbit is way better of course.

### lock_root.sh
1. This bash script can be very usefull. Must be run as root (user@root:~# ./lock_root.sh) unless you add to your path in ~/.zshrc.
2. It is locking the root account, locking the root shell, assigning the chattr +i to /etc/passwd and /etc/shadow to make them immutable
3. This is a script for the paranoid like me, or if you want that extra lockdown layer of security.
4. To unlock everything just run (user@root:~# ./unlock_root.sh)
5. You undo the 4 things that lock_root.sh did just run the following commands.
6. $ sudo chattr = /etc/passwd
7. $ sudo chattr = /etc/shadow
8. $ sudo passwd -u root
9. $ sudo usermod -s /usr/bin/zsh root (You can also manually unlock the shell by editing /usr/bin/nologin to /usr/bin/zsh in /etc/passwd)

### unlock_root.sh
1. This file is the counterpart to the lock_root.sh. Simply run this script when you want to unlock the above mentioned files.
2. Usage: just type unlock_root.sh in the terminal, if in $PATH, or cd into the directory where you pute the script and type: root@debian:~# ./unlock_root.sh

### my parrot .zshrc
1. I uploaded this .zshrc file mostly because I get tired of restoring it from backup.
2. I install Oh-My-Zsh and then add that if statement in the .zshrc file. It really improves the autocompletion.
3. Of course you need to install zsh-autosuggestions, zsh-syntax-highlighting, and zsh-autocomplete for it to work,
4. and them source them in your .zshrc file.

### zsh_autosuggestions_config.txt (ARCH zsh)
1. This file is for Arch and BlackArch, but it works in Debian/Ubuntu as well
2. The files are source in a different location

## Hack The Box (I highly recommend it)   
[](https://referral.hackthebox.com/mzw8ktX)
## Please support me by clicking my safe affiliate links, Thank you!
##### You can send me your Github link to colab or inquires to blackarchguruhacker@protonmail.com
    


   
 

