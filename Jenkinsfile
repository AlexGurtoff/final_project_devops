pipeline {
    agent any
	tool name: 'terraform-11', type: 'terraform'
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'whoami'
            }
        }
        stage('Test'){
            steps {
				sh 'cd terraform'
				sh 'pwd'
				sh 'terraform init'
				sh 'pwd'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo deploy stage'
            }
        }
    }
}