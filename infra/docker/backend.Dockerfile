# ---------- Stage 1: build avec Gradle wrapper ----------
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

# Copie le wrapper Gradle et le cache des deps en premier (pour profiter du cache Docker)
COPY backend/gradlew backend/gradlew.bat backend/ ./
COPY backend/gradle ./gradle
RUN chmod +x gradlew
COPY backend/build.gradle.kts backend/settings.gradle.kts ./
RUN ./gradlew dependencies --no-daemon || true

# Copie le code et build le jar exécutable
COPY backend/src ./src
RUN ./gradlew clean bootJar --no-daemon

# ---------- Stage 2: image d’exécution légère ----------
FROM eclipse-temurin:21-jre
WORKDIR /app

# User non-root (meilleure sécurité)
RUN useradd -ms /bin/bash appuser
USER appuser

# Copie le jar produit dans le stage précédent
COPY --from=build /app/build/libs/*.jar app.jar

# (facultatif) healthcheck si /api/health existe
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://localhost:8080/api/health || exit 1

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]