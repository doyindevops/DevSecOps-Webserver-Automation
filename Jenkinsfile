pipeline {
    agent any

    stages {
        stage ('fetch code') {
            steps {
                script {
                    echo "Pull source code from Git"
                    git branch: 'jenkins', url: 'https://github.com/doyindevops/jenkins_deploy_ec2'
                }
            }
        }
        
        stage ('deploy to EC2') {
            steps {
                script {
                    echo "deploying to shell-script to ec2"
                    def shellCmd = "bash ./websetup.sh"
                    sshagent (['EC2-KEY']) {
                        sh "scp -o StrictHostKeyChecking=no websetup.sh ubuntu@18.132.35.45:/home/ubuntu"
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@18.132.35.45 ${shellCmd}"
                    }
                }
            }
        }
    }
}