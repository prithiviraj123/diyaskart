#!/bin/bash
##
##
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ];then
	sshpass -p "ishaan" scp target/diyaskart.war zeuslab@172.17.0.3:/home/zeuslab/Distros/apache-tomcat-8.5.38/webapps
	sshpass -p "ishaan" ssh zeuslab@172.17.0.3 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_151" "/home/zeuslab/Distros/apache-tomcat-8.5.38/bin/startup.sh"

elif  [ $ENVIRONMENT = "SIT" ];then
	sshpass -p "ishaan" scp target/diyaskart.war zeuslab@172.17.0.4:/home/zeuslab/Distros/apache-tomcat-8.5.38/webapps
	sshpass -p "ishaan" ssh zeuslab@172.17.0.4 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_151" "/home/zeuslab/Distros/apache-tomcat-8.5.38/bin/startup.sh"
echo "deployment has been done!"
fi

