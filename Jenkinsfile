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
    }
    post {
        always {
            archive 'results.xml'
            junit 'results.xml'
        }
    }
}

// specific , multiple slaves, artifacts, test reporting.
// define ENV, conditions, loops
// third party plugin

// Running Jenkins on Docker/Kubernetes


// Test Reporting and artifacts
//    post {
//        always {
//            archive 'build/libs/**/*.jar'
//            junit 'build/reports/**/*.xml'
//        }
//    }