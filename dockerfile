# Use the official OpenJDK 17 image as a base image
FROM openJDK:17
 
# Copy the JAR file to the container
COPY sk4586059/hellodocker.jar hello.jar
 
# Expose port 9092
EXPOSE 8081
 
# Specify the command to run when the container starts
CMD ["java", "-jar", "hello.jar"]