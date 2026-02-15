# Use OmniFish GlassFish image (works reliably on Render)
FROM omnifish/glassfish:latest

# Remove default apps
RUN rm -rf /glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file
COPY ROOT.war /glassfish5/glassfish/domains/domain1/autodeploy/

# Expose the HTTP port
EXPOSE 8080

# Start GlassFish in verbose mode
CMD ["/glassfish5/bin/asadmin", "start-domain", "-v"]
