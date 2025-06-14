@Library("jenkins-shared-library@main") _

pipeline {
    agent any

    environment{
        IMAGE_NAME = 'jenkins_vite_shared'
        SSH_CREDENTIALS_ID = 'ssh-server'
        SSH_HOST = '159.223.95.88'
        SSH_USERNAME = 'github'
        DOCKERHUB_CREDENTIALS = 'Docker'
    }
    
    stages{
        stage ("Build Docker Image"){
            steps{
                script {        
                    docker.docker_build(IMAGE_NAME, env.BUILD_NUMBER)
                }
            }
        }
        stage ("push registry"){
            steps{
                script {
                    docker.dockerhub_push(DOCKERHUB_CREDENTIALS, IMAGE_NAME, env.BUILD_NUMBER)
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
