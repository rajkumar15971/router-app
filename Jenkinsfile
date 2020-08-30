pipeline {
  environment {
    registry = "rajkumar524/react-app"
    registryCredential = 'dockerhub'
    dockerImage = ''
    DOCKER_TAG = getDockerTag()
  }
  agent any
  tools {nodejs "node" }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/rajkumar15971/router-app'
      }
    }
    stage('Build') {
       steps {
         sh 'npm install'
       }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":" + DOCKER_TAG
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}

def getDockerTag(){
  def tag = sh script: 'git rev-parse HEAD', returnStdout: true
  return tag 
}
