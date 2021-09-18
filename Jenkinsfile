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
                dir("terraform") {
				withCredentials([<object of type com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]) {
					sh 'terraform init'
				}
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