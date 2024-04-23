pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/anilkumarn12/final-jenkins.git']])
            }
        }

        stage("terraform init") {
            steps {
                sh 'terraform init'
            }
        }

        stage("plan") {
            steps {
                sh 'terraform plan'
            }
        }

        stage("Action") {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
