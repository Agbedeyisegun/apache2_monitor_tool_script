#!/bin/bash

date=$(date +%Y%m%d%H%M)

 echo "+++++++++++++++++++$date++++++++++++++++++++++++++"

	sudo apt update  &>> /dev/null
	sudo apt install apache2 -y  &> /dev/null

if [[ $? -eq 0 ]]; then 
	
	echo "apache2 is install"
	
	echo 	
	
	mkdir -p /tmp/apache2/

	touch /tmp/apache2/monitlog-$(date).txt

	#echo "Below is the process id"
	
	cat /var/run/apache2/apache2.pid &> /dev/null
	
	if [[ $? -eq 0 ]]; then 
		echo "apache2 is running and active"
	else 	
		echo 
		echo "apache2 services stopped running, but will start running now"
		echo
		sleep 2 
		
		sudo systemctl restart apache2
		echo 
#		sudo systemctl enable apache2 # &> /tmp/apache2/monitlog-$(date).txt
		sudo systemctl enable apache2 &> /tmp/apache2/monitlog-$(date +%Y%m%d%H%M).txt 
		
		echo
		echo "apache services started succcefully"
		echo


	fi

else 
	echo "apache2 is not install but will be installing in some minutes"
	echo "apache installing ---->>"	
	sleep 2
	
	sudo install apache2 -y &> /dev/null
	
	echo "system is installing apache2 now"
		
	sleep 2

	sudo systemctl restart apache2
	sudo systemctl enable apache2
	echo
fi

	     

