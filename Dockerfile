FROM payara/server-full:7.2026.1

# Remove old deployments
RUN rm -rf /opt/payara/deployments/*

# Copy WAR
COPY dist/ROOT.war /opt/payara/deployments/

EXPOSE 8080

# Start server
CMD ["start", "--verbose"]
