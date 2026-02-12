# Lightweight Payara Micro (much better for Render free plan)
FROM payara/micro:5.2022.5

# Copy your WAR file into container
COPY ROOT.war /opt/payara/ROOT.war

# Render provides PORT automatically, so bind to it
CMD ["sh", "-c", "java -jar /opt/payara/payara-micro.jar --deploy /opt/payara/ROOT.war --port $PORT"]
