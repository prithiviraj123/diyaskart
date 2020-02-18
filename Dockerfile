  FROM ubuntu:16.04
MAINTAINER "PRITHIVIRAJ"
  RUN apt-get update
  RUN apt-get install -y openjdk-8-jdk
  ENV JAVA_HOME /usr
  ADD apache-tomcat-8.5.49.tar.gz /root
  COPY target/diyaskart.war /root/apache-tomcat-8.5.49/webapps
  ENTRYPOINT root/apache-tomcat-8.5.49/bin/startup.sh && bash 
