FROM maven:3.9-eclipse-temurin-17-alpine AS builder
WORKDIR /app

COPY Springboot-API-REST-DESPACHO/pom.xml ./

COPY Springboot-API-REST-DESPACHO/ ./

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]