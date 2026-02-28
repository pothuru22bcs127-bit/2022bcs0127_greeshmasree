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
                bat "docker pull ${IMAGE_NAME}"
            }
        }

        stage('Run Container') {
            steps {
                bat "docker run -d -p 8000:8000 --name ${CONTAINER_NAME} ${IMAGE_NAME} || true"
            }
        }

        stage('Wait for Service') {
            steps {
                sleep 15
            }
        }

        stage('Valid Inference Test') {
            steps {
                script {
                    def response = bat(
                        script: "curl -s -X POST http://localhost:8000/predict -H \"Content-Type: application/json\" -d @valid_input.json",
                        returnStdout: true
                    ).trim()

                    echo "Valid Response: ${response}"

                    if (!response.contains("prediction")) {
                        error("Prediction field missing!")
                    }
                }
            }
        }

        stage('Invalid Inference Test') {
            steps {
                script {
                    def response = bat(
                        script: "curl -s -X POST http://localhost:8000/predict -H \"Content-Type: application/json\" -d @invalid_input.json",
                        returnStdout: true
                    ).trim()

                    echo "Invalid Response: ${response}"

                    if (!response.contains("error")) {
                        error("Invalid input did not return error!")
                    }
                }
            }
        }

        stage('Stop Container') {
            steps {
                bat "docker stop ${CONTAINER_NAME} || true"
                bat "docker rm ${CONTAINER_NAME} || true"
            }
        }
    }
}

        
            
