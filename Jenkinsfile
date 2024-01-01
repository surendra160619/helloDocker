pipeline {
    agent any

    environment {
        // Reference to Maven
        MVN_HOME = tool 'maven-3.8.5'
        
        // Docker image information
        DOCKER_REPO_URL = "localhost:8081"
        DOCKER_IMAGE_NAME = "hello-world-java"
        DOCKER_IMAGE_TAG = "${DOCKER_REPO_URL}/${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repo') {
            steps {
                // Get code from a GitHub repository
                git 'https://github.com/surendra160619/helloDocker.git'
            }
        }

        stage('Build Project') {
            steps {
                // Build project via Maven
                sh "'${MVN_HOME}/bin/mvn' -Dmaven.test.failure.ignore clean package"
            }
        }

        stage('Publish Tests Results') {
            parallel {
                stage('Publish Junit Tests Results to Jenkins') {
                    steps {
                        echo "Publish Junit Tests Results"
                        junit '**/target/surefire-reports/TEST-*.xml'
                        archive 'target/*.jar'
                    }
                }

                stage('Publish Junit Tests Results to Sonar') {
                    steps {
                        echo "This is branch b"
                        // Add SonarQube integration steps here
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                sh "whoami"
                sh "mv ./target/helloDocker.jar ./data"
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE_NAME}")
                }
            }
        }

        stage('Deploy Docker Image') {
            steps {
                // Deploy Docker image to Nexus or Docker Hub
                echo "Docker Image Tag Name: ${DOCKER_IMAGE_TAG}"

                sh "docker login -u sk4586059 -p Krishna@meena45 https://hub.docker.com/repository/docker/sk4586059/hellodocker/general"
                sh "docker tag ${DOCKER_IMAGE_NAME} ${DOCKER_IMAGE_TAG}"
                sh "docker push ${DOCKER_IMAGE_TAG}"
            }
        }
    }
}
