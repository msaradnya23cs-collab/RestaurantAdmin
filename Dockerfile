FROM airhacks/glassfish

COPY dist/ROOT.war /opt/payara/deployments/ROOT.war

EXPOSE 8080
