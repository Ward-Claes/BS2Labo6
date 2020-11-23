
FROM maven:3.6.1-jdk-8 as maven_builder

WORKDIR /app

ADD pom.xml .

RUN ["https://github.com/Ward-Claes/BS2Labo6", "mvn", "verify", "clean", "--fail-never"]

ADD . /app

RUN ["mvn","clean","install","-T","2C","-DskipTests=true"]

FROM tomcat:8.5.43-jdk8

COPY --from=maven_builder /app /usr/local/tomcat/webapps
expose 80
