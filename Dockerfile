FROM omnifish/glassfish:latest

# Clear old deployments
RUN rm -rf /opt/glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy WAR file
COPY ROOT.war /opt/glassfish5/glassfish/domains/domain1/autodeploy/

# Expose default GlassFish HTTP port
EXPOSE 8080

# Start GlassFish
CMD ["/opt/glassfish5/bin/asadmin", "start-domain", "-v"]
