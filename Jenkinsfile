pipeline {
    agent any //{ docker 'python:3.5.3' }
    stages {
        stage('Build') {
            steps {
                sh 'echo "Build docker images for project."'
                sh 'whoami'
                sh 'docker --version'
                sh 'docker build -t lifeng2/mydjango .'
            }
        }
        stage('Test') {
            agent { docker 'lifeng2/mydjango' }
            steps {
                sh 'py.test --junit-xml=results.xml /code/tests/'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "Deploying"'
                sh 'docker-compose -p djangodemo build'
                sh 'docker-compose up -d'
            }
        }
    }
}