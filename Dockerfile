# Use OmniFish GlassFish image (official)
FROM omnifish/glassfish:latest

# Remove old auto-deploy apps
RUN rm -rf /opt/glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file
COPY ROOT.war /opt/glassfish5/glassfish/domains/domain1/autodeploy/

# Expose default HTTP port
EXPOSE 8080

# Correct start command for GlassFish
CMD ["/opt/glassfish5/bin/asadmin", "start-domain", "-v"]
