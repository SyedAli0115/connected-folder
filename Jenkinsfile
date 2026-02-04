pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
                ec2-user@${ip}:/var/www/html/index.html
            """
            }
        }
        }
    }
}