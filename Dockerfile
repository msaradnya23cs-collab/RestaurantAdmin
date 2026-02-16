# Use Payara Micro for lightweight deployment
FROM payara/micro:7.2026.1

# Copy your WAR file to deployments
COPY dist/ROOT.war /opt/payara/deployments/

# Copy PostgreSQL JDBC driver
COPY libs/postgresql-42.6.0.jar /opt/payara/appserver/glassfish/lib/

# Set PostgreSQL environment variables
ENV DB_URL=jdbc:postgresql://dpg-d698p26mcj7s738kv76g-a.oregon-postgres.render.com:5432/restaurantdb_9uyr?sslmode=require
ENV DB_USER=admin
ENV DB_PASS=JJmR5tx2uEw71oUZdwQKjQApcql58ulX

# Expose default port
EXPOSE 8080

# Start Payara Micro and deploy your WAR
CMD ["java", "-jar", "/opt/payara/payara-micro.jar", "--deploy", "/opt/payara/deployments/ROOT.war", "--port", "8080"]
