pipeline {
    agent any

    environment {
        COMPOSE_PROJECT_NAME = "fastapi_app"
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Stop Old Containers') {
            steps {
                echo 'Stopping old containers...'
                sh 'docker-compose down || true'
            }
        }

        stage('Build and Run') {
            steps {
                echo 'Building and starting containers...'
                sh 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
