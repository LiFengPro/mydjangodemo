pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Build docker images for project."'
                sh 'docker-compose up'
            }
        }
        stage('Test'){
            steps {
                sh 'make check'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make publish'
            }
        }
    }
}