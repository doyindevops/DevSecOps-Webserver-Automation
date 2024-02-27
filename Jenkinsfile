/*def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]*/

pipeline {
    agent any

    stages {
        stage('fetch code') {
            steps {
                script {
                    echo "Pull source code from Git"
                    git branch: 'jenkins', 
                        url: 'https://github.com/doyindevops/jenkins_deploy_ec2.git'
                }
            }
        }

        stage('Install Apache') {
            steps {
                script {
                    // Install Apache 2 On Ubuntu Server---
                    def apache_install = 'sudo apt-get update && sudo apt-get install apache2 -y'
                    sshagent(['EC2-KEY']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@35.176.20.206 '${apache_install}'"
                    }
                }
            }
        }
        
        stage('Copy Files to EC2') {
            steps {
                script {
                    echo "Copying files to EC2 instance"
                    sshagent(['EC2-KEY']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@35.176.20.206 'sudo rm -rf /var/www/html/* && sudo git clone https://github.com/doyindevops/jenkins_deploy_ec2.git /tmp/site && sudo cp -r /tmp/site/2137_barista_cafe/* /var/www/html/'"
                    }
                }
            }
        }
    }
}
