FROM eclipse-temurin:21
	
WORKDIR /app

COPY target/*.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]
13. Docker Compose
YAML
version: '3'

services:

  postgres:
    image: postgres:16

    environment:
      POSTGRES_DB: hospitaldb
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: admin

  backend:
    build: .

    ports:
      - "8080:8080"

    depends_on:
      - postgres
