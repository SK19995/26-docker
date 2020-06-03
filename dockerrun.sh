#!/bin/bash
#打jar包
mvn clean package
if [ $? -eq 0 ];then
	echo  "jar打包完毕"
  else
        echo “打包失败”
        exit 1
fi
#cd到jar包同级目录
cd target
#创建doxkerfile
echo 'FROM docker.io/openjdk:8-jdk-buster
MAINTAINER sk
ADD demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 9090
ENTRYPOINT ["java","-jar","demo.jar"]' > Dockerfile
sleep 5 
#生成docker镜像
docker build -t my/demo .
sleep 5
#运行镜像生成容器
docker run -itd -p 9090:9090 my/demo:latest

