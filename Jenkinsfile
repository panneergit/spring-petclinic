pipeline {
    agent any
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('VCS') {
            steps {
                git url: 'https://github.com/panneergit/spring-petclinic.git', branch: 'develop'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker image build -t sourcetrace.jfrog.io/workshop-docker-local/petclinic:v1 .'
            }
        }
        stage('Push to Artifactory & Scan') {
            steps {
                sh 'docker image push sourcetrace.jfrog.io/workshop-docker-local/petclinic:v1'
            }
        }
        // stage('Deploy to K8S Cluster') {
        //     steps {
        //         sh 'kubectl apply -f k8s/'
        //     }
        // }
    }
}