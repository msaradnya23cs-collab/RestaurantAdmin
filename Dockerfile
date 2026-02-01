# Use Tomcat 10 base image
FROM tomcat:10.1-jdk17

# Remove default web apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file as ROOT
COPY dist/RestaurantAdmin.war /usr/local/tomcat/webapps/ROOT.war

# Set Render's PORT environment variable
ENV PORT 10000

# Replace Tomcat's default server.xml port with Render's PORT
RUN sed -i "s/port=\"8080\"/port=\"\${PORT}\"/" /usr/local/tomcat/conf/server.xml

# Start Tomcat
CMD ["catalina.sh", "run"]
