pipeline {

    agent any

    environment {
        DOCKER_IMAGE = "admin10987/react-newapp"
        DOCKER_TAG = "latest"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/akshatvyas09/react-newApp.git'
            }
        }


        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }


        stage('Build React Application') {
            steps {
                sh 'npm run build'
            }
        }


        stage('Docker Build') {
            steps {
                sh 'docker build -t admin10987/react-newapp:latest .'
            }
        }


        stage('Docker Login') {
            steps {
                sh '''
                docker login -u admin10987 -p Vyasji@5676
                '''
            }
        }


        stage('Docker Push') {
            steps {
                sh '''
                docker push admin10987/react-newapp:latest

                '''
            }
        }


        stage('Deploy Container') {
            steps {
                sh '''
                docker stop react-container || true
                docker rm react-container || true

                docker run -d \
                --name react-container \
                -p 5173:80 \
                admin10987/react-newapp:latest
                '''
            }
        }
    }
}
