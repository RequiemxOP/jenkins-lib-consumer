@Library('jenkins-shared-lib') _

import org.example.Utilities

pipeline {
    agent any

    stages {
        stage('Say Hello from vars') {
            steps {
                greet('Peter')
            }
        }

        stage('Say Hello from class') {
            steps {
                script {
                    def utils = new Utilities(this)
                    utils.sayHello('Peter')
                }
            }
        }
    }
}
