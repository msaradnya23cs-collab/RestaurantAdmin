# Use OmniFish GlassFish image
FROM omnifish/glassfish:latest

# Clear old deployments
RUN rm -rf /opt/glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR
COPY ROOT.war /opt/glassfish5/glassfish/domains/domain1/autodeploy/

# Expose HTTP port
EXPOSE 8080

# Correct GlassFish start command
CMD ["/opt/glassfish5/glassfish/bin/asadmin", "start-domain", "-v"]
