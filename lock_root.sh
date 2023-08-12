# I know I can make this shorter but it works and it is easy to edit if statements.
# Warning you can lock yourself out of your system! Make sure you have written down all passwords to access system.
# To UNLOCK simply run the counterpart script unlock_root.sh or do it manually
# You can add bin bash comment but it isn't necessary to run
# Recommend using a zsh shell with this because when it locks the shell it assumes zsh


echo "LOCKING DOWN ROOT ACCOUNT, ROOT SHELL, SHADOW FILE, PASSWD FILE!"
sleep 3
if [ -f "/etc/passwd" ]; then
	echo "Attempting to lock down the ROOT account..."
	sudo passwd -l root
	echo "ROOT account lock was successful."
else 	
	echo "Attempt to lock ROOT account failed."
fi

if [ -f "/etc/passwd" ]; then
	echo "Attempting to lock the ROOT shell..."
	sudo usermod -s /usr/bin/nologin root
	echo "ROOT SHELL successfully locked."
	head -1 /etc/passwd
else
	echo "Locking the ROOT SHELL failed."
	head -1 /etc/passwd
fi

sleep 1

if [ -f "/etc/passwd" ]; then
	echo "Attempting to make the PASSWD file immutable..."
	sudo chattr +i /etc/passwd
	echo "Passwd file was given the +i attribute."
	lsattr /etc/passwd
else
	echo "Assigning the +i attribute to the PASSWD file failed."
	lsattr /etc/passwd
fi

if [ -f "/etc/shadow" ]; then
	echo "Attempting to make the SHADOW file immutable..."
	sudo chattr +i /etc/shadow
	echo "SHADOW file was given the +i attribute."
	sudo lsattr /etc/shadow
else
	echo "Assigning the +i attribute to the SHADOW file failed."
	sudo lsattr /etc/shadow
fi
