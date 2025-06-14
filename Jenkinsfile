@Library("jenkins-shared-library@main") _

pipeline {
    agent any

    environment{
        IMAGE_NAME = "jenkins_vite_shared"
    }
    
    stages{
        stage("Build Docker Image"){
            steps{
                script {
                    hello.docker_build(IMAGE_NAME, env.BUILD_NUMBER)
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
