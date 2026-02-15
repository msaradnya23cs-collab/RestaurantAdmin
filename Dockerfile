# Use OmniFish GlassFish image
FROM omnifish/glassfish:latest

# Remove default apps (optional)
RUN rm -rf /opt/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file
COPY ROOT.war /opt/glassfish/domains/domain1/autodeploy/

# Expose the HTTP port
EXPOSE 8080

# Start GlassFish
CMD ["/opt/glassfish/bin/asadmin", "start-domain", "-v"]
