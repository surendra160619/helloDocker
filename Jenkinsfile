pipeline {
    agent any

    environment {
        // Remove the specific Maven version
        // MVN_HOME = tool 'maven-3.9.6'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/surendra160619/helloDocker.git'
            }
        }

        stage('Build Project') {
            steps {
                script {
                    // Use the 'maven' label to let Jenkins automatically choose a Maven installation
                    def mvnHome = tool 'maven'
                    sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
                }
            }
        }

        // ... other stages ...

        stage('Deploy Docker Image') {
            steps {
                script {
                    // Use the 'maven' label to let Jenkins automatically choose a Maven installation
                    def mvnHome = tool 'maven'
                    sh "mv ./target/helloDocker*.jar ./data" 
                   dockerImage = docker.build("hello-world-java")
                }
            }
        }
    }
}
