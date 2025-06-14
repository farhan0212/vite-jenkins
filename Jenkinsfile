@Library("jenkins-shared-library@main") _

pipeline {
    agent any
    
    stages{
        stage ("hello world") {
            agent{
                docker {
                    image 'node:22-alpine'
                    reuseNode true
                }
            }
            steps{
                script {
                    hello.world()
                    echo('installing from shared library')
                    hello.npm_install()
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
