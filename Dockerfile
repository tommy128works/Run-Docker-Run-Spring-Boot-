# copied from ChatGPT - please review

# ===== Stage 1: Build =====
FROM eclipse-temurin:21-jdk as build

# # Set working directory
# WORKDIR /build
#
# # Copy Gradle wrapper and configuration files first (for better caching)
# COPY gradlew settings.gradle.kts build.gradle.kts ./
# COPY gradle ./gradle
#
# # Download dependencies (faster rebuilds)
# RUN ./gradlew dependencies
#
# # Copy source code last
# COPY src ./src
#
# # Build the application
# RUN ./gradlew clean build -x test

# ===== Stage 2: Run =====
FROM eclipse-temurin:21-jre

# # Set working directory
# WORKDIR /app
#
# # Copy the JAR from the build stage
# COPY --from=build /build/build/libs/*.jar app.jar
#
# # Expose the app's port
# EXPOSE 8080
#
# # Run the application
# ENTRYPOINT ["java", "-jar", "app.jar"]
