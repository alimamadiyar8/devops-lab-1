pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "devops-app:${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Java App') {
            steps {
                docker.image('maven:3.8-openjdk-11').inside {
                    sh '''
                    cd app
                    mvn clean package assembly:single -DskipTests
                    '''
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t devops-app:latest .
                '''
            }
        }
        
        stage('Start Services') {
            steps {
                sh '''
                docker-compose down -v
                docker-compose up -d
                '''
            }
        }
    }
    
    post {
        always {
            sh 'docker-compose down -v'
        }
    }
}
