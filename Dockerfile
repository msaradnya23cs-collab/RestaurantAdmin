# Use Tomcat 9 + JDK 11 (Java EE 7 compatible)
FROM tomcat:9.0-jdk11

# Remove default web apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR as ROOT
COPY dist/RestaurantAdmin.war /usr/local/tomcat/webapps/ROOT.war

# Use Render's PORT
ENV PORT=${PORT}

# Replace Tomcat's default port with Render's PORT
RUN sed -i "s/port=\"8080\"/port=\"\${PORT}\"/" /usr/local/tomcat/conf/server.xml

# Expose the port for local testing
EXPOSE ${PORT}

# Start Tomcat
CMD ["catalina.sh", "run"]
