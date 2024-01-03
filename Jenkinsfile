
pipeline {
    environment {
        registry = "sk4586059/hellodocker"
        registryCredential = 'jankins'
        dockerImage = ''
	
    }
    agent any
    
  
 		tools {
        maven 'Maven3'
       // jdk 'openJDK17'
    }
    stages {
       
			stage('Build') {
			    steps { 
			   bat 'mvn clean install -DskipTests'
}
			}
			
		stage('Test'){
			steps{
				bat "mvn test"
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
