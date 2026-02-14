FROM tomcat:9.0-jdk17

# Copy MySQL driver directly into Tomcat lib
COPY mysql.jar /usr/local/tomcat/lib/mysql.jar

# Copy WAR
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
