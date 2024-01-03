
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

    }
}
