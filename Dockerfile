FROM ubuntu:16.04

RUN apt update
RUN apt install -y git wget
RUN apt install -y openjdk-8-jdk

# Maven
RUN wget http://apache.spd.co.il/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz /tmp/apache-maven-3.5.2-bin.tar.gz
WORKDIR /opt
RUN tar xf /tmp/apache-maven-3.5.2-bin.tar.gz

RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
RUN export PATH=/opt/apache-maven-3.5.2/bin:$PATH
RUN mvn -h

WORKDIR amir
ADD . /amir
RUN git clone https://github.com/akrk1986/spring-petclinic.git amir

CMD ["mvn", "-h"]
