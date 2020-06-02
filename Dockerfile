#!/bin/bash
echo 'FROM docker.io/openjdk:8-jdk-buster
MAINTAINER sk
ADD demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 9090
ENTRYPOINT ["java","-jar","demo.jar"]' > Dockerfile
sleep 5 
docker build -t my/demo .
sleep 5
docker run -itd -p 9090:9090 my/demo:latest

