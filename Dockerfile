FROM openjdk:8u111-jre-alpine

MAINTAINER Dieter Wimberger "dieter@wimpi.net"

EXPOSE 10389

RUN apk add --no-cache openssl
RUN mkdir /ldap/config
WORKDIR /ldap
RUN wget https://github.com/kwart/ldap-server/releases/download/2016-10-04/ldap-server.jar

COPY users.ldif /ldap/config/users.ldif

CMD ["java","-jar","ldap-server.jar", "config/users.ldif"]

