pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git https://github.com/pothuru22bcs127-bit/2022bcs0127_greeshmasree.git

            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t YOUR_DOCKERHUB_USERNAME/ml-model .'
            }
        }

        stage('Run Model Training') {
            steps {
                sh '''
                echo "Name: GREESHMASREE"
                echo "Roll No: 2022BCS0127"
                python3 train.py
                '''
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh '''
                docker login -u YOUR_DOCKERHUB_USERNAME -p YOUR_DOCKERHUB_PASSWORD
                docker push YOUR_DOCKERHUB_USERNAME/ml-model
                '''
            }
        }

    }
}
