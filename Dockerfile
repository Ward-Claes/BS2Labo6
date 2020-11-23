from alpine/git
WORKDIR /app
Run git clone https://github.com/Ward-Claes/BS2Labo6.git


FROM maven:3.6.1-jdk-8-alpine
workdir /app
copy --from=0 /app/Ward-Claes /app
Run mvn clean install

FROM tomcat:8.5.43-jdk8

COPY /app /usr/local/tomcat/webapps
expose 8080
