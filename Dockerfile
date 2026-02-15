FROM airhacks/glassfish:6.2.5

ENV JVM_ARGS="-Xms32m -Xmx160m -XX:MaxMetaspaceSize=96m -XX:+UseSerialGC"

COPY dist/ROOT.war $DEPLOYMENT_DIR/ROOT.war

EXPOSE 8080