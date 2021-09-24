pipeline {
    agent any
	environment {
	AWS_KEYS=credentials('Admin-AWS')
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
			sh 'sleep 5'
            ansiblePlaybook credentialsId: 'Hurtov-Paris', disableHostKeyChecking: true, inventory: '/var/lib/jenkins/inventory', playbook: 'ansible/playbook.yml'
            }
        }
    }
}