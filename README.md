# Jenkins swarm slave

[`csanchez/jenkins-swarm-slave`](https://registry.hub.docker.com/u/csanchez/jenkins-swarm-slave/)

A [Jenkins swarm](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin) slave.

For a container with ssh enabled see
[`csanchez/jenkins-slave`](https://registry.hub.docker.com/u/csanchez/jenkins-slave/)

## Running

To run a Docker container passing [any parameters](https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin#SwarmPlugin-AvailableOptions) to the slave

    docker run csanchez/jenkins-swarm-slave -master http://jenkins:8080 -username jenkins -password jenkins -executors 1

Run container with name and disable clients unique id:
```bash
$ docker container run --name dockerslave -d jswarm -master http://jenkins:8080 -username admin -password tokenID -mode normal -name dockerslave -disableClientsUniqueId -executors 3
```

Linking to the Jenkins master container there is no need to use `--master`

    docker run -d --name jenkins -p 8080:8080 csanchez/jenkins-swarm
    docker run -d --link jenkins:jenkins csanchez/jenkins-swarm-slave -username jenkins -password jenkins -executors 1


# Building

    docker build -t csanchez/jenkins-swarm-slave .

# I have prepared `docker-compose.yml` to start 3 swarm agent i 3 docker container which we can call via `starter.sh` script. `Dockerfile` and `jenkins-slave.sh` moved to the `jswarmslave` folder.
