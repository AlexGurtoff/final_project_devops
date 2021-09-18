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
        ansiblePlaybook(
        playbook: 'ansible/playbook.yml',
        inventory: 'ansible/inventory',
        credentialsId: 'Hurtov-Paris',
        hostKeyChecking: false
    )
//         stage('Deploy'){
//             steps {
//                 dir("ansible") {
// 					sh "ansible-playbook playbook.yml"
//                     }
//             }
//         }
    }
}