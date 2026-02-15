# Use OmniFish GlassFish image
FROM omnifish/glassfish:latest

# Clean previous deployments
RUN rm -rf /opt/glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR
COPY ROOT.war /opt/glassfish5/glassfish/domains/domain1/autodeploy/

# Expose port 8080
EXPOSE 8080

# Start GlassFish using the correct path
CMD ["/opt/glassfish5/glassfish/bin/asadmin", "start-domain", "-v"]
