pipeline {
    agent any //{ docker 'python:3.5.3' }
    stages {
        stage('Build') {
            steps {
                sh 'echo "Build docker images for project."'
                sh 'whoami'
                // sh 'docker-compose up'
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