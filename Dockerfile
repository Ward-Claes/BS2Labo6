FROM alpine/git
WORKDIR /app
Run git clone https://github.com/Ward-Claes/BS2Labo6.git

FROM maven:3.6.1-jdk-8-alpine
WORKDIR /app
copy --from=0 /app/BS2Labo6 /app
RUN mvn clean install
RUN echo $(ls -a)

FROM tomcat:8.5.43-jdk8
copy --from=1 /app /app
RUN echo $(ls -a)
RUN echo $(ls -a ./webapps)
RUN echo $(ls -a ./temp)
RUN echo $(ls -a ./lib)
COPY /target/project-ucll-1.0-SNAPSHOT.war /usr/local/tomcat/webapps
EXPOSE 8080
