FROM alpine/git
WORKDIR /app
Run git clone https://github.com/Ward-Claes/BS2Labo6.git
run echo $(ls -a)

FROM maven:3.6.1-jdk-8-alpine
WORKDIR /app
copy --from=0 /app/BS2Labo6 /app
RUN mvn clean install
run echo $(ls -a)

FROM tomcat:8.5.43-jdk8
WORKDIR /app
run echo $(ls -a)
COPY --from=1 /app/project-ucll-1.0-SNAPSHOT.war /usr/local/tomcat/webapps
EXPOSE 8080
