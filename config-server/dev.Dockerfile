FROM eclipse-temurin:17-jdk-alpine
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
EXPOSE 8888
ENTRYPOINT ["java","-cp","app:app/lib/*","-Dspring.profiles.active=native","com.toursapp.configserver.ConfigServerApplication"]
