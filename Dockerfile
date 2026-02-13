FROM tomcat:9.0-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"$PORT\\\"/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]
