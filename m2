version: '2'

services:
  db:
    image: arungupta/oreilly-couchbase
    ports:
      - 8091:8091
      - 8092:8092
      - 8093:8093
      - 11210:11210

  app:
    build: ./webapp
    image: arungupta/docker-jenkins-app

  app2:
    image: arungupta/docker-jenkins-pipeline:${BUILD_NUMBER}

  unit:
    image: maven
    volumes:
      - .:/usr/src/myapp
      - /tmp/go:/go
    command: bash -c "mvn test"
