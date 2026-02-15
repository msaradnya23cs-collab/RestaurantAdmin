FROM tomcat:9.0-jdk17

COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war
