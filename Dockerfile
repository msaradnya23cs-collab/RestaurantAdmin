FROM airhacks/glassfish

ENV JVM_ARGS="-Xms32m -Xmx128m -XX:MaxMetaspaceSize=64m -XX:+UseSerialGC"

COPY dist/ROOT.war /opt/glassfish/domains/domain1/autodeploy/ROOT.war

EXPOSE 8080
