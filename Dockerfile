FROM maven:3.8-openjdk-11 AS builder
WORKDIR /build
COPY app/ .
RUN mvn clean package assembly:single -DskipTests

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=builder /build/target/*.jar app.jar
EXPOSE 5000
CMD ["java", "-jar", "app.jar"]
