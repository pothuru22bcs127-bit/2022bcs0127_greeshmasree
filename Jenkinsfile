pipeline {
    agent any

    environment {
        IMAGE_NAME = "2022bcs0127greeshmasree/jenkins-python"
        CONTAINER_NAME = "ml-inference-test"
    }

    stages {

        stage('Checkout') {
            steps {
                git url: 'https://github.com/pothuru22bcs127-bit/2022bcs0127_greeshmasree.git', branch: 'main'
            }
        }

        stage('Pull Image') {
            steps {
                sh "docker pull ${IMAGE_NAME}"
            }
        }

        stage('Run Container') {
            steps {
                sh "docker run -d -p 8000:8000 --name ${CONTAINER_NAME} ${IMAGE_NAME} || true"
            }
        }

        stage('Wait') {
            steps {
                sleep 15
            }
        }

        stage('Valid Test') {
            steps {
                script {
                    def response = sh(
                        script: "curl -s -X POST http://localhost:8000/predict -H 'Content-Type: application/json' -d @valid_input.json",
                        returnStdout: true
                    ).trim()

                    echo response

                    if (!response.contains("prediction")) {
                        error("Prediction missing")
                    }
                }
            }
        }

        stage('Stop Container') {
            steps {
                sh "docker stop ${CONTAINER_NAME} || true"
                sh "docker rm ${CONTAINER_NAME} || true"
            }
        }
    }
}
