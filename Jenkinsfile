	//pipeline {
	//environment {
	//registry = "sk4586059/hellodocker"
	//registryCredential = 'dockerhub'
	//dockerImage = ''
	//}
	//agent any
	//stages {
	//stage('Cloning our Git') {
	//steps {
	//git 'https://github.com/surendra160619/helloDocker.git', branch: 'main'
	//}
	//}
    //stage('build docker image') {
    //  steps {
    //    sh 'docker build -t sk4586059/hellodocker:latest .'
    //  }
    //}
    //stage('push docker image') {
    //  steps {
     //   script {
          //withCredentials([string(credentialsId: 'dockerhub_token', variable: 'dockerhub_token')]) {
       //   sh 'docker login -u sk4586059 -p  dckr_pat_d5Dv5KfwJ5kMTsQvMu7HOFyM2to'
       //   sh 'docker push sk4586059/hellodocker:latest'
          //}
       // }
     // }
    //}
//}
//}

pipeline {
    environment {
        registry = "sk4586059/hellodocker"
        registryCredential = 'jankins'
        dockerImage = ''
	
    }
    agent any
 tools {
        maven 'Maven3'
         jdk 'jdk17' 
    }
    stages {
        stage('Cloning our Git') {
            steps {
             git url: 'https://github.com/surendra160619/helloDocker.git', branch: 'main'
             
            }
        }
			stage('Maven Build') {
			    steps {
			        // Assuming Maven is installed on the Jenkins agent
			      //  bat 'docker.io/maven:3.6-mvn clean install'
			   bat "mvn clean install -DskipTests"
			      
			         
			    
			    }
			}




        stage('Build Docker Image') {
            steps {
                bat 'docker build -t sk4586059/hellodocker .'
            }
        }

  stage('Push Docker Image') {
    steps {
 script {
    withCredentials([string(credentialsId: 'dckr_pat_mEPY0OcrVD33pLlITuzMEUe_mHg', variable: 'sk458059')]) {
        // Log in to Docker Hub
      
        bat " docker login -u your_username -p Krishna@meena45"
        
        // Pull the base image (if needed)
        bat "docker pull library/openjdk:17 sk4586059/hellodocker"

        // Tag the pulled image
        bat "docker tag library/openjdk:17 sk4586059/hellodocker:latest"

        // Push the tagged image to Docker Hub
        bat "docker push sk4586059/hellodocker:latest"
    }
}
    }
}
    }
}
