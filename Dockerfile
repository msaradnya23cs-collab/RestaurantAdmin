# Use official GlassFish 4.1 image
FROM glassfish:4.1

# Remove default applications (optional)
RUN rm -rf $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/*

# Copy your WAR file to autodeploy
COPY dist/RestaurantAdmin.war $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/

# Expose HTTP port
EXPOSE 8080

# Start GlassFish in foreground mode
CMD ["asadmin", "start-domain", "-v", "domain1"]
