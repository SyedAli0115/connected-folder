pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Folder') {
            steps {
                echo "Building project..."
                sh 'ls -la'
            }
        }

        stage('Deploy Folder (Local)') {
            steps {
                sh '''
                  mkdir -p /tmp/jenkins-deploy
                  cp -r * /tmp/jenkins-deploy
                '''
            }
        }

        stage('EC2 Setup via Terraform') {
        steps {
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',credentialsId: 'aws-jenkins']]) {
            sh '''
                cd terraform
                terraform init
                terraform apply -auto-approve
            '''
            }
        }
        }

        stage('Deploy Webpage') {
        steps {
            script {
            def ip = sh(
                script: "cd terraform && terraform output -raw public_ip",
                returnStdout: true
            ).trim()

            sh """
                scp -o StrictHostKeyChecking=no \
                -i ~/.ssh/jenkins \
                index.html \
                cloud_user@${ip}:/var/www/html/index.html
            """
            }
        }
        }
    }
}