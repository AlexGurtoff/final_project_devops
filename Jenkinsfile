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
                dir("terraform/create_webserver") {
					sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                    }
				dir("terraform/create_inventory") {
					sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                    }
            }
        }
        stage('Deploy'){
            steps {
            ansiblePlaybook credentialsId: 'Hurtov-Paris', disableHostKeyChecking: true, inventory: '/var/lib/jenkins/inventory', playbook: 'ansible/playbook.yml'
            }
        }
    }
}