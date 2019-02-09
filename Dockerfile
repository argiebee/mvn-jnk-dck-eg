FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY target/gs-spring-boot*.jar gs-spring-boot.jar
ENTRYPOINT ["java","-jar","/gs-spring-boot.jar"]