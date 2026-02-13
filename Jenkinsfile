pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repo
                git url: 'https://github.com/pothuru22bcs127-bit/2022bcs0127_greeshmasree.git', branch: 'main'
            }
        }

        stage('Info') {
            steps {
                echo 'Lab 5: Automated Model Deployment Using Jenkins'
                echo 'Name: GREESHMASREE, Roll No: 2022BCS0127'
            }
        }

        stage('Manual Training Reminder') {
            steps {
                echo '⚠ Python training will be run manually on host:'
                echo 'cd <your-repo-folder> && python train.py && python evaluate.py'
                echo 'Metrics will be printed along with your name and roll number'
            }
        }
    }
}
