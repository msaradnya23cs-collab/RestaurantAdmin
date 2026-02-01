# Use Payara 4.1 Full Server (GlassFish-compatible)
FROM payara/server-full:4.1.2.174

# Remove default apps (optional, keeps server clean)
RUN rm -rf $PAYARA_PATH/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file into the autodeploy folder
# Make sure your WAR is named ROOT.war to deploy at /
COPY dist/RestaurantAdmin.war $PAYARA_PATH/glassfish/domains/domain1/autodeploy/ROOT.war

# Expose the default HTTP port
EXPOSE 8080

# Set the PORT environment variable (Render uses dynamic ports)
ENV PORT 10000

# Change Payara HTTP listener port to Render's PORT
RUN sed -i "s/<network-listener port=\"8080\"/<network-listener port=\"\${PORT}\"/" \
    $PAYARA_PATH/glassfish/domains/domain1/config/domain.xml

# Start Payara in foreground
CMD ["asadmin", "start-domain", "--verbose"]
