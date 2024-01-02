
FROM openjdk:17
EXPOSE 8081

ADD target/helloDocker.jar helloDocker.jar
#COPY target/helloDocker.jar hello.jar

CMD ["java", "-jar", "/helloDocker.jar"]