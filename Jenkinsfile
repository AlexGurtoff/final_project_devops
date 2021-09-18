pipeline {
    agent any
	environment {
	THE_BUTLER_SAYS_SO=credentials('Admin-AWS')
	}
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
                dir("terraform") {
					sh 'terraform init'
                    sh 'pwd'
                    sh 'terraform apply -auto-approve'
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