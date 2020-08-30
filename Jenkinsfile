node {
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {

        def customImage = docker.build("rajkumar524/react-app")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
