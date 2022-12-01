FROM eclipse-temurin:17-jdk-alpine
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
EXPOSE 8090
ENTRYPOINT ["java","-cp","app:app/lib/*","-Dspring.profiles.active=docker","com.toursapp.tourslocationslayers.ToursLocationsLayersApplication"]
