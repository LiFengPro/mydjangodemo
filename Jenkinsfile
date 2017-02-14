pipeline {
    agent { label 'master' }
    environment {
        FLAG = 'SomeEnv'
    }
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
                echo env.FLAG
                sh 'echo "$FLAG"'

                script {
                    def browsers = ['chrome', 'firefox']
                    for (int i = 0; i < browsers.size(); ++i) {
                        echo "Testing the ${browsers[i]} browser"
                    }
                    if (env.BRANCH_NAME == 'master') {
                        echo 'I only execute on the master branch'
                    } else {
                        echo 'I execute elsewhere'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker stack deploy -c docker-compose.yml mydjangostack'
            }
        }
    }
}
