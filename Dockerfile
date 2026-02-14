FROM tomcat:9.0-jdk17

# Add MySQL driver directly to Tomcat (bulletproof)
ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.3.0/mysql-connector-j-8.3.0.jar /usr/local/tomcat/lib/

# Copy WAR
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
