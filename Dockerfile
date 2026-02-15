FROM tomcat:9.0-jdk17

# Copy MySQL Driver into Tomcat global lib
COPY mysql.jar /usr/local/tomcat/lib/mysql.jar

# Copy WAR file
COPY dist/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
