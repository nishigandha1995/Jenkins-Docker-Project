pipeline {
          agent any
    stage('git checkout') {
        git 'https://github.com/nishigandha1995/Jenkins-Docker-Project.git'  
    }
    
     stage('docker build image') {
        sh "docker image build -t ${JOB_NAME}:v1.${BUILD_ID} ."
        sh "docker image tag ${JOB_NAME}:v1.${BUILD_ID} nishi11/${JOB_NAME}:v1.${BUILD_ID}"
        sh "docker image tag ${JOB_NAME}:v1.${BUILD_ID} nishi11/${JOB_NAME}:latest"
    }
    
    stage('pushing image to dockerHub') {
        
        withCredentials([string(credentialsId: 'docker', variable: 'docker')]) {
            sh "docker login -u nishi11 -p '${docker}'"
            sh "docker image push nishi11/${JOB_NAME}:v1.${BUILD_ID}"
            sh "docker image push nishi11/${JOB_NAME}:latest"
            sh "docker image rm ${JOB_NAME}:v1.${BUILD_ID} nishi11/${JOB_NAME}:v1.${BUILD_ID} nishi11/${JOB_NAME}:latest"
        }
        
        stage('docker container deployment'){
        def docker_run = 'docker run -itd --name juli5 -p 9000:80 nishi11/docker-groovy-webapplication'
        
        sshagent(['webapp']) {
        sh "ssh -o StrictHostKeyChecking=no ubuntu@10.0.1.236 ${docker_run}"
        }
      }
    }
}  
