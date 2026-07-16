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
    }
}
