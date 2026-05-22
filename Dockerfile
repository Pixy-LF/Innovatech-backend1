FROM maven:3.9-eclipse-temurin-17-alpine AS builder
WORKDIR /app

COPY Springboot-API-REST-DESPACHO/ ./Springboot-API-REST-DESPACHO/
WORKDIR /app/Springboot-API-REST-DESPACHO

RUN mvn clean package -DskipTests -Dstart-class=com.citt.SpringbootApiRestDespachoApplication

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

COPY --from=builder /app/Springboot-API-REST-DESPACHO/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]