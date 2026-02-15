# Use OmniFish GlassFish image
FROM omnifish/glassfish:latest

# Remove default apps
RUN rm -rf /glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file
COPY ROOT.war /glassfish5/glassfish/domains/domain1/autodeploy/

# Expose HTTP port
EXPOSE 8080

# Use the correct start command (full path to asadmin)
ENTRYPOINT ["/glassfish5/glassfish/bin/asadmin", "start-domain", "-v"]
