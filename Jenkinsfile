	pipeline {
	environment {
	registry = "sk4586059/hellodocker"
	registryCredential = 'dockerhub'
	dockerImage = ''
	}
	agent any
	stages {
	stage('Cloning our Git') {
	steps {
	git 'https://github.com/surendra160619/helloDocker.git', branch: 'main'
	}
	}
    stage('build docker image') {
      steps {
        sh 'docker build -t sk4586059/hellodocker:latest .'
      }
    }
    stage('push docker image') {
      steps {
        script {
          //withCredentials([string(credentialsId: 'dockerhub_token', variable: 'dockerhub_token')]) {
          sh 'docker login -u sk4586059 -p  dckr_pat_d5Dv5KfwJ5kMTsQvMu7HOFyM2to'
          sh 'docker push sk4586059/hellodocker:latest'
          //}
        }
      }
    }



	}
	}