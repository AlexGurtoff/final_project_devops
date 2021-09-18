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
            ansiblePlaybook(credentialsId: 'Hurtov-Paris', inventory: 'ansible/inventory', playbook: 'playbook.yml')
            }
        }
    }
}