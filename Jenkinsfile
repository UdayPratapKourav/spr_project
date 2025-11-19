pipeline {
    agent any

    environment {
        // Define environment variables if needed
        COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Checkout') {
            steps {
                // Jenkins automatically checks out your repo, but you can be explicit
                checkout scm
            }
        }

        stage('Build Images') {
            steps {
                sh """
                    docker compose -f ${DOCKER_COMPOSE_FILE} build
                """
            }
        }

        stage('Run Services') {
            steps {
                sh """
                    docker compose -f ${DOCKER_COMPOSE_FILE} up -d
                """
            }
        }

      
    }

    post {
        always {
            // Clean up containers/images even if pipeline fails
            sh "docker compose -f ${DOCKER_COMPOSE_FILE} down --volumes --remove-orphans"
        }
    }
}
