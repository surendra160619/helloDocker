
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
               // bat 'docker login -u sk4586059 -p Krishna@meena45'
			   // bat 'docker push sk4586059/hellodocker .'
			   
			    withCredentials([string(credentialsId: 'dckr_pat_nAK0kSmwHuNPDmMH4CdVFL9EL-0', variable: 'sk458059')]) {
			      bat 'docker login -u sk4586059 -p Krishna@meena45'
			    bat 'docker push sk4586059/hellodocker .'
            }
        }
       } 


    }
}
