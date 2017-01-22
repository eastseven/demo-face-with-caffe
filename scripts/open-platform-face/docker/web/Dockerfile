FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER eastseven "eastseven@foxmail.com"

EXPOSE 8000-9999

VOLUME /workspace
VOLUME /upload
VOLUME /logs
ADD app.jar app.jar
RUN sh -c 'touch app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-Duser.timezone=GMT+8","-jar","app.jar"]