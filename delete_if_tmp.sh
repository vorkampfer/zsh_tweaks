# I know I can make this shorter but it works
# Safely delete the common world writable directories

if [ -d "/tmp" ] && [ -w "/tmp" ]; then
	echo "Attempting to delete all temp files..."
	sudo rm -rf /tmp/*
	echo "listing files in temp."
	ls -lahr /tmp
else 	
	echo "Not all files were deleted."
	ls -lahr /tmp
fi

if [ -d "/var/temp" ] && [ -w "/var/temp" ]; then
	echo "Attempting to delete all var.tmp files..."
	sudo rm -rf /var/tmp/*
	echo "listing files in var.temp."
	ls -lahr /var/tmp
else 	
	echo "Not all files were deleted."
	ls -lahr /tmp
fi

if [ -d "/dev/shm" ] && [ -w "/dev/shm" ]; then
	echo "Attempting to delete all dev.shm files..."
	sudo rm -rf /dev/shm/*
	echo "listing files in temp."
	ls -lahr /dev/shm
else 	
	echo "Not all files were deleted."
	ls -lahr /dev/shm
fi
