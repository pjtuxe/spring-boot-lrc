#-- Build stage
FROM maven:3.6.2-jdk-11-slim AS build

WORKDIR /app

COPY ./pom.xml ./pom.xml
RUN mvn de.qaware.maven:go-offline-maven-plugin:resolve-dependencies
COPY . .
RUN mvn -N install
RUN mvn clean package

#-- Runtime stage
FROM openjdk:11-jre-slim

WORKDIR /app
COPY --from=build /app/target/ .

EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "demo-0.0.1-SNAPSHOT.jar" ]
