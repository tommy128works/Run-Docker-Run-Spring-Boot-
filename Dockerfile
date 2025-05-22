# ===== Stage 1: Builder =====
FROM eclipse-temurin:21-jdk AS builder

# Set working directory
WORKDIR /app

# Copy Gradle Wrapper files
COPY gradlew gradlew.bat .

# Copy gradle folder into the gradle folder in the working directory
COPY gradle ./gradle

# Copy the Gradle project files into the working directory
COPY build.gradle settings.gradle .

# Copy src folder into the src folder in the working directory
COPY src ./src

# Ensure Gradle Wrapper has executable permissions
RUN chmod +x gradlew

# Build the application
RUN ./gradlew bootJar --no-daemon

# ===== Stage 2: Production =====
FROM eclipse-temurin:21-jre AS production

# # Set working directory
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=builder /app/build/libs/hyper-web-app-0.0.1-SNAPSHOT.jar app.jar

# Expose the app's port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
