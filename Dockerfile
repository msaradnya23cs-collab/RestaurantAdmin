FROM payara/micro:5.2022.5-jdk11

# Copy WAR file
COPY ROOT.war /opt/payara/deployments/ROOT.war

# Use Render dynamic port
CMD ["--deploy", "/opt/payara/deployments/ROOT.war", "--port", "${PORT}"]
