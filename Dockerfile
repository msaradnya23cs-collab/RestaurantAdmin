# Use maintained Eclipse GlassFish image (works for your JSP/Servlet app)
FROM ghcr.io/eclipse-ee4j/glassfish:6.2.5

# Remove default apps
RUN rm -rf /glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy your WAR
COPY ROOT.war /glassfish5/glassfish/domains/domain1/autodeploy/

# Expose port
EXPOSE 8080

# Start GlassFish server
CMD ["/glassfish5/bin/asadmin", "start-domain", "-v"]
