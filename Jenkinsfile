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

        stage('Clean Up Old Containers') {
            steps {
                echo 'Stopping and removing old containers (if any)...'
                bat '''
                    docker-compose down --remove-orphans || exit 0
                    docker container prune -f || exit 0
                '''
            }
        }

        stage('Build and Deploy') {
            steps {
                echo 'Building and running Docker containers...'
                bat 'docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed.'
        }
    }
}
