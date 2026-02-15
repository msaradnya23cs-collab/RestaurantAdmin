FROM airhacks/glassfish

ENV JVM_ARGS="-Xms64m -Xmx256m"

COPY dist/ROOT.war /opt/glassfish7/glassfish/domains/domain1/autodeploy/ROOT.war

EXPOSE 8080
