# Use the official OpenJDK 17 image as a base image
FROM openjdk:17
 
 WORKDIR /rajkosh3.0

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


FROM docker.io/openjdk:11.0.4-jre-slim
WORKDIR /rajkosh3.0

COPY --from=build /rajkosh3.0/target/helloDocker-0.0.1-SNAPSHOT.jar ./
COPY --from=build /rajkosh3.0/target/libs ./libs

EXPOSE 8081
 
# Specify the command to run when the container starts
CMD ["java", "-jar", "helloDocker-0.0.1-SNAPSHOT.jar"]