pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Building project..."
                sh 'ls -la'
            }
        }

        stage('Deploy (Local)') {
            steps {
                sh '''
                  mkdir -p /tmp/jenkins-deploy
                  cp -r * /tmp/jenkins-deploy
                '''
            }
        }
    }
}