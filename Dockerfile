# Use official GlassFish image
FROM glassfish:6.2.5

# Remove default app
RUN rm -rf /glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR into autodeploy
COPY ROOT.war /glassfish5/glassfish/domains/domain1/autodeploy/

# Expose default GlassFish port
EXPOSE 8080

# Start GlassFish server
CMD ["/glassfish5/bin/asadmin", "start-domain", "-v"]
