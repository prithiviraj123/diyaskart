pipeline {
    agent any

	tools {
		maven 'maven3.6'
	}
//
//	environment {
//		M2_INSTALL = "/home/zeuslab/Distros/apache-maven-3.6.0/bin/mvn"
//	}

    stages {
		stage('Clone-Repo') {
			steps {
				checkout scm
			}
		}
		stage('Build') {
	    	steps {
				sh 'mvn install -DskipTests'
			}
	    }
		stage('Unit Tests') {
			steps {
				sh 'mvn surefire:test'
			}
		}
		stage('Deployment') {
	    	steps {
				
        sshpass -p "ishaan" scp target/diyaskart.war zeuslab@172.17.0.3:/home/zeuslab/Distros/apache-tomcat-8.5.38/webapps
        sshpass -p "ishaan" ssh zeuslab@172.17.0.3 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_151" "/home/zeuslab/Distros/apache-tomcat-8.5.38/bin/startup.sh"
}
}
}
}
