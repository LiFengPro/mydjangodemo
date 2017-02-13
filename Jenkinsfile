pipeline {
    agent { label 'master' }
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
            agent {
                docker {
                    label 'master'
                    image 'lifeng2/mydjango'
                }
            }
            steps {
                sh 'py.test --junit-xml=results.xml /code/tests/'
            }
            post {
                always {
                    archive '*.xml'
                    junit '*.xml'
                }
            }
        }
        stage('TestSlave') {
            agent { label 'slave1' }
            steps {
                sh 'echo "HELLO WORLD"'
            }
        }
    }
}
