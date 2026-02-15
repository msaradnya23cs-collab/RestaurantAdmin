FROM airhacks/glassfish

ENV JVM_ARGS="-Xms32m -Xmx192m -XX:MaxMetaspaceSize=96m"

COPY dist/ROOT.war /opt/glassfish7/glassfish/domains/domain1/autodeploy/ROOT.war

EXPOSE 8080
