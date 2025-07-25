pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = '905418327670.dkr.ecr.us-east-1.amazonaws.com/flask-ecs-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Prudvi14/flask-ecs-app.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t flask-ecs-app .'
            }
        }

        stage('Push to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO
                docker tag flask-ecs-app:latest $ECR_REPO:latest
                docker push $ECR_REPO:latest
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                cd flask-ecs-terraform
                terraform init
                terraform apply -auto-approve
                '''
            }
        }
    }
}
