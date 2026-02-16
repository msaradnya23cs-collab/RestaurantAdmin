FROM payara/micro:7.2026.1

# Copy WAR file
COPY ROOT.war /opt/payara/deployments/ROOT.war

# Expose port
EXPOSE 8080

# Start Payara Micro
CMD ["java", "-jar", "/opt/payara/payara-micro.jar", "--deploy", "/opt/payara/deployments/ROOT.war", "--port", "8080", "--contextroot", "/"]
