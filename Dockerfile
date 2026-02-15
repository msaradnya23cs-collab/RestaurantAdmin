# Use OmniFish GlassFish image
FROM omnifish/glassfish:latest

# Remove default apps
RUN rm -rf /glassfish/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file
COPY ROOT.war /glassfish/glassfish/domains/domain1/autodeploy/

# Expose GlassFish port
EXPOSE 8080

# Start the server
CMD ["/glassfish/glassfish/bin/asadmin", "start-domain", "-v"]
