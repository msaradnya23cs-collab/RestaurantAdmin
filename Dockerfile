# Use Omnifish GlassFish base image
FROM omnifish/glassfish:latest

# Remove auto-deploy apps
RUN rm -rf /opt/glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file
COPY ROOT.war /opt/glassfish5/glassfish/domains/domain1/autodeploy/

# Expose HTTP port
EXPOSE 8080

# Environment variables for DB (set these on Render)
ENV DB_URL=""
ENV DB_USER=""
ENV DB_PASS=""

# Start GlassFish server in foreground
CMD ["/opt/glassfish5/glassfish/bin/asadmin", "start-domain", "--verbose"]
