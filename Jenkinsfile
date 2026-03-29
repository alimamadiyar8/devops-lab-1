pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Код GitHub-тан алынды'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Қолданба құрастырылуда...'
                sh 'echo "Build completed"'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Тестілеу жүргізілуде...'
                sh 'echo "Tests passed"'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Орналастыру...'
                sh 'echo "Deploy completed"'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline аяқталды'
        }
        success {
            echo 'Сәтті аяқталды!'
        }
        failure {
            echo 'Қатемен аяқталды'
        }
    }
}
