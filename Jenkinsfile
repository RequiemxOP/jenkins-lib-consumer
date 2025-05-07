pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_NAME = "yourdockerhubusername/myapp"
    }

    stages {
        stage('Pull from Git') {
            steps {
                echo '✅ Pulling latest code from Git repository'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🔨 Building Docker image'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                echo '🔐 Logging into DockerHub'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo '📦 Pushing Docker image to DockerHub'
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy to Existing Server') {
            steps {
                echo '🚀 Deploying Docker container on existing environment'
                sh '''
                docker stop myapp || true
                docker rm myapp || true
                docker pull $IMAGE_NAME
                docker run -d --name myapp -p 80:80 $IMAGE_NAME
                '''
            }
        }
    }
}

