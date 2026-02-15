FROM airhacks/glassfish

# Limit JVM memory so it works on Render free plan
ENV JVM_ARGS="-Xms64m -Xmx256m -XX:MaxMetaspaceSize=128m"

# Copy your WAR file
COPY dist/ROOT.war /opt/glassfish7/glassfish/domains/domain1/autodeploy/ROOT.war

# Expose port
EXPOSE 8080
