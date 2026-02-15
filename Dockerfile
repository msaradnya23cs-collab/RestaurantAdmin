# Use Omnifish GlassFish base image
FROM omnifish/glassfish:latest

# Remove auto-deploy apps
RUN rm -rf /glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file
COPY ROOT.war /glassfish5/glassfish/domains/domain1/autodeploy/

# Expose HTTP port
EXPOSE 8080

# Use environment variables for DB
ENV DB_URL=""
ENV DB_USER=""
ENV DB_PASS=""

# Start GlassFish server in foreground
CMD ["/glassfish5/bin/asadmin", "start-domain", "--verbose"]
