pipeline {
    agent any
	environment {
	THE_BUTLER_SAYS_SO=credentials('Admin-AWS')
	}
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Create infrastructure') {
            steps {
                dir("terraform") {
					sh 'terraform init'
                    sh 'pwd'
                    sh 'terraform apply -auto-approve'
                    }
            }
        }
        stage('Deploy'){
            steps {
                dir("ansible") {
					sh 'ansible-playbook playbook.yml'
                    }
            }
        }
    }
}