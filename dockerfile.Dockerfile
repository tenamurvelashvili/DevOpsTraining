
ARG JAVA_VERSION=17
FROM openjdk:${JAVA_VERSION}-jdk-slim
WORKDIR /app
RUN addgroup --system appgroup && \
    adduser --system --ingroup appgroup appuser
ARG DEFAULT_WHO=World
ENV WHO=${DEFAULT_WHO}
COPY target/*.jar app.jar
USER appuser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
