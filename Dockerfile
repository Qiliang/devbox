FROM openjdk:8

MAINTAINER xiaoql <xiaoqlster@gmail.com>

ENV MVN_VERSION=3.5.4 \
TZ=Asia/Shanghai

RUN apt-get install -y git  wget && \
wget http://mirrors.hust.edu.cn/apache/maven/maven-3/$MVN_VERSION/binaries/apache-maven-$MVN_VERSION-bin.tar.gz &&\
tar xvf apache-maven-$MVN_VERSION-bin.tar.gz && mv apache-maven-$MVN_VERSION  /usr/local/apache-maven &&\
wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.34/bin/apache-tomcat-8.5.34.tar.gz &&\
tar xvf apache-tomcat-8.5.34.tar.gz && mv apache-tomcat-8.5.34 /usr/local/tomcat  &&\
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV CATALINA_HOME=/usr/local/tomcat M2_HOME=/usr/local/apache-maven M2=/usr/local/apache-maven/bin \
PATH=/usr/local/apache-maven/bin:$PATH PATH=/usr/local/tomcat/bin:$PATH 
