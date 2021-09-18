pipeline {
    agent any
	environment {
	AWS_KEYS=credentials('Admin-AWS')
	AUTHORIZED_KEY=credentials('Hurtov-Paris')
	}
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Create infrastructure') {
            steps {
                dir("terraform") {
					sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                    }
            }
        }
        stage('Deploy'){
            steps {
                dir("ansible") {
					sh "ansible-playbook playbook.yml --extravars \"ssh_key_data=${AUTHORIZED_KEY}\""
                    }
            }
        }
    }
}