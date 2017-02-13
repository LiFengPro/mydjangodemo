pipeline {
    agent none
    stages {
        stage('Test') {
            agent { docker 'lifeng2/mydjango' }
            steps {
                sh 'py.test --junit-xml=results.xml /code/tests/'
            }
        }
    }
    post {
        always {
            archive '*.xml'
            junit '*.xml'
        }
    }
}

// specific , multiple slaves, artifacts, test reporting.
// define ENV, conditions, loops
// third party plugin

// Running Jenkins on Docker/Kubernetes


// third party plugin
// https://github.com/jenkinsci/pipeline-plugin/blob/master/COMPATIBILITY.md

// Test Reporting and artifacts
// Attention Need to install Copy To Slave Plugin
//    post {
//        always {
//            archive 'build/libs/**/*.jar'
//            junit 'build/reports/**/*.xml'
//        }
//    }