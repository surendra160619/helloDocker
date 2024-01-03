
pipeline {
    
    agent any
   
	tools {
        maven 'Maven3'
        jdk 'jdk17'
      def dockerRepoUrl = 'localhost:8081'
    def dockerImageName = 'hellodocker'
    def dockerImageTag = '${dockerRepoUrl}/${dockerImageName}:${env.BUILD_NUMBER}'
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
        
            stage('Deploy Docker Image'){
      
      // deploy docker image to nexus

      echo "Docker Image Tag Name: ${dockerImageTag}"
      bat 'docker login -u sk4586059 -p Krishna@meena45  ${dockerRepoUrl}'
      bat 'docker push sk4586059/hellodocker .'
    }
        
        
        


    }
}
