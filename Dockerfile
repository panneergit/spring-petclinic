FROM maven:3-amazoncorretto-17 AS builder
COPY . /spring-petclinic
RUN cd /spring-petclinic && mvn package

FROM gcr.io/distroless/java17-debian12:latest
COPY --from=builder /spring-petclinic/target/spring-petclinic-3.1.0-SNAPSHOT.jar /app/spring-petclinic-3.1.0-SNAPSHOT.jar
WORKDIR /app
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]
