pipeline {
    agent any

    stages {
        stage ('fetch code') {
            steps {
                script {
                    echo "Pull source code from Git"
                    git branch: 'main', url: 'https://github.com/doyindevops/DevSecOps-Webserver-Automation.git'
                }
            }
        }
        
        stage ('deploy to EC2') {
            steps {
                script {
                    echo "deploying to shell-script to ec2"
                    def shellCmd = "bash ./websetup.sh"
                    sshagent (['EC2-KEY']) {
                        sh "scp -o StrictHostKeyChecking=no websetup.sh ec2-user@13.36.237.46:/home/ec2-user"
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.36.237.46 ${shellCmd}"
                    }
                }
            }
        }
    }
}
