# Use latest stable Payara 5 Full
FROM payara/server-full:5.2022.5

# Remove default deployed apps
RUN rm -rf /opt/payara/appserver/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file
COPY ROOT.war /opt/payara/appserver/glassfish/domains/domain1/autodeploy/

# Expose port
EXPOSE 8080

# Start Payara
CMD ["asadmin", "start-domain", "--verbose"]
