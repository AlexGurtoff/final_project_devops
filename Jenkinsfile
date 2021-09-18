pipeline {
    agent any
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
                dir('/home/ubuntu/final_project/terraform') {
				sh 'terraform apply --auto-approve'
				}
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo deploy stage'
            }
        }
    }
}