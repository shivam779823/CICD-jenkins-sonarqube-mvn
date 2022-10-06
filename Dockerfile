
# # Maven build container 

# FROM maven:3.8.5-openjdk-11 AS maven_build

# COPY pom.xml /tmp/

# COPY src /tmp/src/

FROM maven:3.8.5-openjdk-11 AS maven_build
MAINTAINER shivam@gmail.com
WORKDIR /app
COPY pom.xml /app/
COPY src /app/src
RUN mvn package


FROM openjdk:8-jre-alpine3.9
EXPOSE 8080
COPY --from=maven_build /app/target/hello-world-0.1.0.jar /hello-world-0.1.0.jar
CMD java -jar /hello-world-0.1.0.jar