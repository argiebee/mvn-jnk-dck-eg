FROM maven:3.6.0-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/gs-spring-boot*.jar gs-spring-boot.jar
ENTRYPOINT ["java","-jar","/gs-spring-boot.jar"]
