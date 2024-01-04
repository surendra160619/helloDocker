
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
                    bat 'docker login -u sk4586059 -p Krishna@meena45'
			
						// Push the tagged image to Docker Hub
			bat 'docker push sk4586059/hellodocker:latest'
			
			// Pull the base image (if needed)
			bat 'docker pull  sk4586059/hellodocker'
           bat 'docker run sk4586059/hellodocker:latest'
			// Tag the pulled image
			//bat 'docker tag  sk4586059/hellodocker:latest'


              }
		  
			
		

  }
  }
}
}
