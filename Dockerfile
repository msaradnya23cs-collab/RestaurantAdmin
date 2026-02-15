# Use official GlassFish 4.1 image
FROM glassfish:4.1

# Remove default apps
RUN rm -rf /glassfish4/glassfish/domains/domain1/autodeploy/*

# Copy your WAR to autodeploy
COPY ROOT.war /glassfish4/glassfish/domains/domain1/autodeploy/

# Expose GlassFish default port
EXPOSE 8080

# Start the server
CMD ["/glassfish4/bin/asadmin", "start-domain", "-v"]
