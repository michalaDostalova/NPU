pipeline {
    agent {
        docker {
            image 'mcr.microsoft.com/playwright:v1.37.0-focal' // Use the official Playwright Docker image
        }
    }
    stages {
        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                echo 'Building TypeScript project...'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                sh 'npm test'
            }
        }
        stage('Playwright Tests') {
            steps {
                echo 'Running Playwright tests...'
                sh 'npx playwright test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // Replace the following with your deployment commands
                sh 'npm run deploy'
            }
        }
        stage('Execute Shell Example') {
            steps {
                echo 'Running shell commands...'
                sh '''
                    echo "Hello, World!"
                    echo "Current directory is: $(pwd)"
                    ls -la
                '''
            }
        }
        stage('Execute Windows Batch Command Example') {
            steps {
                echo 'Running batch commands...'
                bat '''
                    echo Hello, World!
                    echo Current directory is: %cd%
                    dir
                '''
            }
        }
    }
    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Sending notifications...'
            // Add notification commands here, e.g., email or Slack
        }
    }
}