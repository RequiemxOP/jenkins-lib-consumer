pipeline {
    agent any

    environment {
        IMAGE_NAME = "requiemxop/jenkins-lib-consumer"
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')  // ID you set in Jenkins credentials
    }

    stages {
        stage('Clone Git Repo') {
            steps {
                echo '✅ Cloning from GitHub...'
                // If pipeline is already triggered via Git SCM, this can be skipped
                sh 'git clone https://github.com/RequiemxOP/jenkins-lib-consumer.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🔨 Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('DockerHub Login') {
            steps {
                echo '🔐 Logging in to DockerHub...'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo '📤 Pushing Docker image...'
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Deploy to Existing Server') {
            steps {
                echo '🚀 Deploying the container...'
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
