
pipeline {
    
    agent any
	tools {
        maven 'Maven3'
        jdk 'jdk17'
    }
        stages {
    

			stage('Build') {
			    steps { 
			   bat 'mvn clean install'
					}
			  }
			
		stage('Test'){
			steps{
				bat 'mvn test'
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
	    withCredentials([string(credentialsId: 'Krishna@meena45', variable: 'sk458059')]) {
		
		
		  
			bat 'docker login -u sk4586059 -p Krishna@meena45'
			
			// Pull the base image (if needed)
			bat 'docker pull  sk4586059/hellodocker'

			// Tag the pulled image
			bat 'docker tag  sk4586059/hellodocker:latest'

			// Push the tagged image to Docker Hub
			bat 'docker push sk4586059/hellodocker:latest'
		}
	}
  }
  }
}
}
