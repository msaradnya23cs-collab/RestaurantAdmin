FROM tomcat:9.0-jdk17

# Install curl
RUN apt-get update && apt-get install -y curl

# Download MySQL driver directly into Tomcat lib
RUN curl -L -o /usr/local/tomcat/lib/mysql.jar \
https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.3.0/mysql-connector-j-8.3.0.jar

# Copy WAR
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
