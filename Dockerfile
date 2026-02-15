FROM airhacks/glassfish

ENV JVM_ARGS="-Xms64m -Xmx256m"

COPY dist/ROOT.war /opt/payara/deployments/ROOT.war

EXPOSE 8080
