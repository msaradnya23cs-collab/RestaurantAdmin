FROM tomcat:9.0-jdk17

COPY web/WEB-INF/lib/mysql.jar /usr/local/tomcat/lib/mysql.jar

COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
