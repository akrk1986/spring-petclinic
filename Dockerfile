FROM ubuntu:16.04

RUN apt update && apt install -y git wget openjdk-8-jdk

# Maven
RUN wget -q -O /tmp/apache-maven-3.5.2-bin.tar.gz http://apache.spd.co.il/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
WORKDIR /opt
RUN tar xf /tmp/apache-maven-3.5.2-bin.tar.gz

WORKDIR /amir
ADD . /amir

RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre && export PATH=/opt/apache-maven-3.5.2/bin:$PATH
# Build package, skip integration tests
#RUN ./mvnw spring-boot:repackage -Dskip.it=true

# This will skip the tests
RUN ./mvnw package -Dskip.it=true

EXPOSE 8080

CMD ["/bin/bash", "-c", "echo 'sleep 4 mins' && sleep 240 && ./mvnw spring-boot:run"]
