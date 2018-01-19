FROM ubuntu:16.04

RUN apt update
RUN apt install -y git wget
RUN apt install -y openjdk-8-jdk

# Maven
RUN wget -q -O /tmp/apache-maven-3.5.2-bin.tar.gz http://apache.spd.co.il/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz 
WORKDIR /opt
RUN tar xf /tmp/apache-maven-3.5.2-bin.tar.gz

WORKDIR /amir
ADD . /amir

RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
RUN export PATH=/opt/apache-maven-3.5.2/bin:$PATH 
RUN ./mvnw spring-boot:build-info
#RUN export PATH=/opt/apache-maven-3.5.2/bin:$PATH && ./mvnw spring-boot:run
 
EXPOSE 8080

#CMD ["/bin/bash", "-c", "./mvnw spring-boot:run >/tmp/pc.OUT 2>/tmp/pc.ERR"]
CMD ["/bin/bash", "-c", "./mvnw spring-boot:run"]
