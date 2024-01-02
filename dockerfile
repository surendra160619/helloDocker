
#FROM openjdk:17
#EXPOSE 8081

#ADD target/helloDocker.jar helloDocker.jar
#COPY target/helloDocker.jar hello.jar

#CMD ["java", "-jar", "/helloDocker.jar"]



FROM openjdk:17
EXPOSE 8081
ADD target/helloDocker.jar helloDocker.jar
ENTRYPOINT ["java","-jar","/helloDocker.jar"]