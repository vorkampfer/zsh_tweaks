if [ -d "/tmp" ] && [ -w "/tmp" ]; then
	echo "Attempting to delete all temp files..."
	sudo rm -rf /tmp/*
	echo "listing files in temp."
	ls -lahr /tmp
else 	
	echo "Not all files were deleted."
	ls -lahr /tmp
fi
