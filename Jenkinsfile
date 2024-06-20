pipeline {
    agent any
    tools {
        maven 'Maven_Home' // Ensure this matches the name in Global Tool Configuration
    }
    environment {
        MAVEN_HOME = tool name: 'Maven_Home', type: 'hudson.tasks.Maven$MavenInstallation'
        PATH = "${env.PATH}:${MAVEN_HOME}/bin"
    }
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github', url: 'https://github.com/anilkumarn12/final-jenkins.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'mvn test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'mvn deploy'
                }
            }
        }
    }
}
