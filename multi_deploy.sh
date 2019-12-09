#!/bin/bash

for i in `cat multi-deploy-IPs.txt`
	do
#
	echo "Deploying war file into $i QA server.."
	sleep 3
	sshpass -p "ishaan" scp target/diyaskart.war zeuslab@$i:/home/zeuslab/Distros/apache-tomcat-8.5.38/webapps
#
	echo "Starting tomcat server in $i QA server.."
	sshpass -p "ishaan" ssh zeuslab@$i "JAVA_HOME=/home/zeuslab/Distros/jdk1.8.0_151" "/home/zeuslab/Distros/apache-tomcat-8.5.38/bin/startup.sh"
#
	done
	echo "Deployment is succussful!"
