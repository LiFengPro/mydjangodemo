pipeline {
    agent any //{ docker 'python:3.5.3' }
    stages {
        stage('Build') {
            steps {
                sh 'echo "Build docker images for project."'
                sh 'whoami'
                sh 'docker --version'
                sh 'docker image ls'
                sh 'docker-compose -p djangodemo build'
            }
        }
        stage('Test') {
            agent { docker 'djangodemo_web' }
            steps {
                sh 'py.test --junit-xml=results.xml /code/tests/'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "Deploying"'
                sh 'docker-compose -p djangodemo up'
            }
        }
    }
}