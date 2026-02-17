FROM payara/micro:5.2022.5-jdk11

# Copy WAR as ROOT
COPY ROOT.war /opt/payara/deployments/ROOT.war

# Expose port
EXPOSE 8080

# Force Payara to deploy ROOT.war
CMD ["java", "-jar", "/opt/payara/payara-micro.jar", "--deploymentDir", "/opt/payara/deployments", "--contextRoot", "/"]
