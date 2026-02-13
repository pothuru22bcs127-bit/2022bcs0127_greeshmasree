pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t 2022bcs0127greeshmasree/ml-model .'
            }
        }

        stage('Run Model Training') {
            steps {
                echo "Running model training inside Docker..."
                // No need to mount data or download CSV; it's already in the image
                sh 'docker run --rm 2022bcs0127greeshmasree/ml-model'
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo "Pushing Docker image to DockerHub..."
                // Make sure you're logged in on Jenkins node
                sh 'docker push 2022bcs0127greeshmasree/ml-model'
            }
        }
    }
}
