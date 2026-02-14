FROM tomcat:9.0-jdk17

# Copy MySQL Driver to Tomcat lib folder
COPY mysql-connector-j.jar /usr/local/tomcat/lib/

# Copy your WAR
COPY dist/RestaurantAdmin.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
