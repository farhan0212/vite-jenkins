@Library("jenkins-shared-library@main") _

pipeline {
    agent any
    
    stages{
        stage ("hello world") {
            agent{
                docker {
                    image 'node:22-alpine'
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
}
