pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t 2022bcs0127greeshmasree/ml-model .'
            }
        }

        stage('Run Model Training') {
            steps {
                sh '''
                echo "Name: GREESHMASREE"
                echo "Roll No: 2022BCS0127"
                docker run --rm 2022bcs0127greeshmasree/ml-model python3 train.py
                '''
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'docker push 2022bcs0127greeshmasree/ml-model'
            }
        }
    }
}
