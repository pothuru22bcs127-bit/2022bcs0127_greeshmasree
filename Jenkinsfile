pipeline {
    agent any
    environment {
        PYTHON = "python" // adjust if using virtual env
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/pothuru22bcs127-bit/2022bcs0127_greeshmasree.git', branch: 'main'
            }
        }
        stage('Train Model') {
            steps {
                sh "${env.PYTHON} train.py"
            }
        }
        stage('Evaluate Model') {
            steps {
                sh "${env.PYTHON} evaluate.py"
                sh "echo 'Name: GREESHMASREE, Roll No: 2022BCS0127'"
            }
        }
    }
}
