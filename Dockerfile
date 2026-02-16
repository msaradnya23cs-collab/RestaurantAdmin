FROM payara/micro:5.2022.5-jdk11

# Copy your WAR file
COPY ROOT.war /opt/payara/deployments/

# Expose Render port
EXPOSE 8080

# Start Payara correctly
CMD ["--deploy", "/opt/payara/deployments/ROOT.war", "--port", "8080"]
