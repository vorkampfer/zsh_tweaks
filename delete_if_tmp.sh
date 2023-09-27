# I know I can make this shorter but it works
# Safely delete the common world writable directories

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
	echo "listing files in tmp."
	ls -lahr /tmp
else 	
	echo "Not all files were deleted in tmp."
	ls -lahr /tmp
fi
