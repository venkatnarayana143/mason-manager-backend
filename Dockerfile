FROM eclipse-temurin:17-jdk-alpine AS build
# Force Rebuild: 2025-11-29-14-45
WORKDIR /app

# Copy Maven files
COPY pom.xml .
COPY src ./src

# Install Maven
RUN apk add --no-cache maven

# Build the application
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Download Datadog Java APM agent
ADD https://dtdg.co/latest-java-tracer dd-java-agent.jar

# Copy the built jar
COPY --from=build /app/target/manager-0.0.1-SNAPSHOT.jar app.jar

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# Run with Datadog agent
ENTRYPOINT ["java", "-javaagent:dd-java-agent.jar", "-Dspring.profiles.active=prod", "-jar", "app.jar"]
