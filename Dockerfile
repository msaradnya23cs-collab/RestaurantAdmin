FROM tomcat:9.0-jdk17

COPY mysql.jar /usr/local/tomcat/lib/mysql.jar

COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
