
# Use the official OpenJDK 17 image as a base image
#FROM openjdk:17
FROM openjdk:17 as build

# Copy the JAR file to the container
COPY target/helloDocker.jar hellodocker.jar
 
# Expose port 9092
EXPOSE 8081
 
# Specify the command to run when the container starts
CMD ["java", "-jar", "hellodocker.jar"]