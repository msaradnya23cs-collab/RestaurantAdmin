# Use official OmniFish GlassFish image
FROM omnifish/glassfish:latest

# Remove any previous auto-deployed apps
RUN rm -rf /opt/glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file to auto-deploy folder
COPY ROOT.war /opt/glassfish5/glassfish/domains/domain1/autodeploy/

# Expose GlassFish default port
EXPOSE 8080

# Start GlassFish
CMD ["/opt/glassfish5/bin/asadmin", "start-domain", "-v"]
