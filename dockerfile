# Use the official OpenJDK 17 image as a base image
FROM docker.io/maven:3.8-jdk-17 as build
 
 WORKDIR /helloDocker

# Create a first layer to cache the "Maven World" in the local repository.
# Incremental docker builds will always resume after that, unless you update
# the pom
ADD pom.xml .
RUN mvn package -Dmaven.test.skip

ADD src src
#ADD settings.xml .

#RUN mvn package -DskipTests
#RUN echo "done!"


# Do the Maven build!
# Incremental docker builds will resume here when you change sources

#RUN mvn package -DskipTests
#RUN --mount=type=cache,target=/root/.m2 mvn package -Dmaven.test.skip
RUN mvn package -DskipTests
RUN echo "done!"


FROM docker.io/openjdk:17-jre-slim
WORKDIR /helloDocker

COPY --from=build /helloDocker/target/helloDocker-0.0.1-SNAPSHOT.jar ./
COPY --from=build /helloDocker/target/libs ./libs

EXPOSE 8081
 
# Specify the command to run when the container starts
CMD ["java", "-jar", "helloDocker-0.0.1-SNAPSHOT.jar"]"hellodocker.jar"]