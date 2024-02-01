#!/bin/bash

date=$(date +%Y%m%d%H%M)

 echo "+++++++++++++++++++$date++++++++++++++++++++++++++"

	sudo mkdir -p /tmp/apache2/

	sudo touch /tmp/apache2/monitlog.txt
	sudo echo $(date +%Y%m%d%H%M) >> /tmp/apache2/monitlog.txt
	
	sudo apt update  &>> /dev/null
	
	sudo apt install apache2 -y  &>> /tmp/apache2/monitlog.txt

if [[ $? -eq 0 ]]; then 
	
	echo "apache2 is install"
	
	echo 	
	

	cat /var/run/apache2/apache2.pid &>> /tmp/apache2/monitlog.txt
	
	if [[ $? -eq 0 ]]; then 
		echo "apache2 is running and active"
	else 	
		echo 
		echo "apache2 services stopped running, but will start running now"
		echo
		sleep 1 
		
		sudo systemctl restart apache2
		echo 
		sudo systemctl enable apache2 &>> /tmp/apache2/monitlog.txt 
		
		echo
		echo "apache services started succcefully"
		echo


	fi

else 
	echo "apache2 is not install but will be installing in some minutes"
	echo "apache installing ---->>"	
	sleep 1
	
	sudo install apache2 -y &>> /tmp/apache2/monitlog.txt

	echo "system is installing apache2 now"
		
	sleep 1

fi
	sudo mkdir -p /tmp/apache2/launch
	cd /tmp/apache2/launch/
	
if [[ -e /tmp/apache2/launch/2098_health.zip ]]; then
		
	echo "this has already downloaded in this path"
else
	echo "this download will start now"

       	sudo wget https://www.tooplate.com/zip-templates/2098_health.zip	

	unzip -o 2098_health.zip -d /tmp/apache2/launch/ &>> /tmp/apache2/monitlog.txt

fi

	sudo cp -R /tmp/apache2/launch/2098_health/* /var/www/html/ &>> /tmp/apache2/monitlog.txt

	if [[ $? -eq 0 ]]; then

		echo "2098_health copy successfully"

	else

		echo "2098_health not copy successfully"

	fi

		sudo systemctl restart apache2 
		sudo systemctl enable apache2
	
		echo "apache2 restart is ready and Your Website to ready launch"
	
	

