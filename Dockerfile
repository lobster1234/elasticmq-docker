FROM openjdk:8u151-alpine
WORKDIR /tmp
RUN wget  https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-0.13.9.jar 
COPY custom.conf /tmp/
EXPOSE 9324
CMD  java -Dconfig.file=custom.conf -jar elasticmq-server-0.13.9.jar

