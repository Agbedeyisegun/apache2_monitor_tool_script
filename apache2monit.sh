#!/bin/bash

date=$(date +%Y%m%d%H%M)

# echo "+++++++++++++++++++$date++++++++++++++++++++++++++"

sudo apt update # &>> /dev/null
sudo apt install apache2 # &>> /dev/null

if [[ $? -eq 0 ]]; then 
	
	echo "apache 2 is already install"
	
	# mkdir -p /tmp/apache2/monitlog-(date +%Y%m%d%H%M).txt
	echo "Below is the process id"

	cat /var/run/apache2/apache2.pid #&>> /dev/null
	
	if [[ $? -eq 0 ]]; then 
		echo "apache2 is running and active"
	else 	
		echo "apache2 stopped running but will start running now in 2min"
		sleep 2 
		sudo systemctl restart apache2
		sudo systemctl enable apache2



	fi

else 
	echo "apache2 is not install but will be installing in some minutes"
	
	sleep 2
	
	sudo install apache2
	
	echo "system is installing apache2 now"
	
	sleep 2

	sudo systemctl restart apache2
	sudo systemctl enable apache2
	
fi

	       	
