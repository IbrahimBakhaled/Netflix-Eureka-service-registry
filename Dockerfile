# Docker file for the Read Service
#
# Version 0.0.1

#jdk image
FROM openjdk:11-jre-slim

# install

# label for the image
LABEL Description="Eureka Server" Version="1.0"

# the version of the archive
ARG VERSION=1.0

# mount the temp volume
VOLUME /tmp

# Add the service as app.jar
ADD target/eureka-server-${VERSION}-SNAPSHOT.jar app.jar

# touch the archive for timestamp
RUN sh -c 'touch /app.jar'

# entrypoint to the image on run
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
