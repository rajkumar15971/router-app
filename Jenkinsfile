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
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push(DOCKER_TAG)
              dockerImage.push(latest)
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$DOCKER_TAG"
      }
    }
  }
}

def getDockerTag(){
  def tag = sh script: 'git rev-parse HEAD', returnStdout: true
  return tag 
}
