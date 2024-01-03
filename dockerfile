# Use the official OpenJDK 17 image as a base image
#FROM openjdk:17

#FROM openjdk:17-jdk-slim
# WORKDIR /helloDocker
# Copy the JAR file to the container
#COPY target/helloDocker.jar hellodocker.jar
 
# Expose port 9092
#EXPOSE 8081
 
# Specify the command to run when the container starts
#CMD ["java", "-jar", "hellodocker.jar"]



FROM maven:3.8.1-openjdk-17 as builder
COPY src /tmp/src/
COPY pom.xml /tmp/
WORKDIR /tmp/
RUN mvn clean install


FROM maven:3.8.1-openjdk-17
COPY --from=builder /tmp/target/*.jar hellodocker.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","hellodocker.jar"]