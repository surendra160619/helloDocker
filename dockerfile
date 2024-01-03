# Use the official OpenJDK 17 image as a base image
FROM openjdk:17
 
# Copy the JAR file to the container
# COPY target/helloDocker.jar hellodocker.jar
 
# Expose port 9092
# EXPOSE 8081
 
# Specify the command to run when the container starts
# CMD ["java", "-jar", "hellodocker.jar"]




ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} hellodocker.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/hellodocker.jar"]
