# Docker file for the Read Service
#
# Version 0.0.1

#jdk image
FROM adoptopenjdk/openjdk11:alpine-jre

# install

# label for the image
LABEL Description="Eureka Server" Version="1.0"

# the version of the archive
ARG VERSION=1.0
ARG CERT="eureka-0.eureka.default.svc.cluster.download.cer"
# mount the temp volume
VOLUME /tmp

COPY eureka-0.eureka.default.svc.cluster.download.crt $JAVA_HOME/lib/security
RUN \
    cd $JAVA_HOME/lib/security \
    && keytool -importcert -alias relevebancaire-docker -storepass changeit -trustcacerts -noprompt -keystore cacerts -file eureka-0.eureka.default.svc.cluster.download.crt

# Add the service as app.jar
ADD target/eureka-server-${VERSION}-SNAPSHOT.jar app.jar

# touch the archive for timestamp
RUN sh -c 'touch /app.jar'

# entrypoint to the image on run
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
