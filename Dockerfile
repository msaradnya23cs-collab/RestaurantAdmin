# Use OmniFish GlassFish image (supports JSP/Servlet)
FROM omnifish/glassfish:latest

# Remove default apps in domain1
RUN rm -rf /glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file
COPY ROOT.war /glassfish5/glassfish/domains/domain1/autodeploy/

# Expose HTTP port
EXPOSE 8080

# Start GlassFish (correct path!)
CMD ["/glassfish5/bin/asadmin", "start-domain", "-v"]
