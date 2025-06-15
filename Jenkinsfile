@Library("jenkins-shared-library@main") _

pipeline {
    agent any

    environment{
        IMAGE_NAME = 'farhan0212/jenkins_vite_shared'
        SSH_CREDENTIALS_ID = 'ssh-server'
        SSH_HOST = '159.223.95.88'
        SSH_USERNAME = 'github'
        DOCKERHUB_CREDENTIALS = 'Docker'
    }
    
    stages{
        stage ("build and push registry"){
            steps{
                script {
                    dockerHelper.docker_build_push(DOCKERHUB_CREDENTIALS, IMAGE_NAME, env.BUILD_NUMBER)
                }
            }
        }
        stage ("ssh action") {
            steps{
                script {
                    sshHelper.ssh_action(SSH_CREDENTIALS_ID, SSH_USERNAME, SSH_HOST)
                }
            }
        }
    }
    post{
        always {
            cleanWs(cleanWhenSuccess: true)
        }
        success {
            echo(message: 'success')
        }
    }
}
