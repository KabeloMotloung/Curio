# Multi-stage Dockerfile for Curio application
# Stage 1: Build the Vue.js frontend
FROM node:20-alpine AS frontend-build
WORKDIR /app/frontend

# Copy frontend files
COPY frontend/package*.json ./
RUN npm install

# Copy frontend source code
COPY frontend/ ./
# Skip TypeScript type checking during build
RUN npm run build-only

# Stage 2: Build the Spring Boot backend
FROM maven:3.9-eclipse-temurin-21-alpine AS backend-build
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml ./
COPY mvnw ./
COPY mvnw.cmd ./
COPY .mvn ./.mvn

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy backend source code
COPY src ./src

# Copy the built frontend into the static resources directory
COPY --from=frontend-build /app/frontend/dist ./src/main/resources/static

# Build the application
RUN mvn clean package -DskipTests -B

# Stage 3: Final runtime image
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Set default environment variables
ENV PORT=5000
ENV SPRING_PROFILES_ACTIVE=prod

# Copy the built JAR file from the build stage
COPY --from=backend-build /app/target/*.jar app.jar

# Expose the application port
EXPOSE 5000

# Command to run the application
CMD ["java", "-jar", "-Dserver.port=${PORT}", "app.jar"]