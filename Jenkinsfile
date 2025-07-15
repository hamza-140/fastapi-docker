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
                bat '''
                    docker ps -aq --filter "name=fastapi-app" | for /F "tokens=*" %%i in ('more') do docker rm -f %%i
                '''
            }
        }

        stage('Build and Run') {
            steps {
                echo 'Building and running containers...'
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
