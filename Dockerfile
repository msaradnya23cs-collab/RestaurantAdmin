FROM airhacks/glassfish

ENV JVM_ARGS="-Xms32m -Xmx256m -XX:MaxMetaspaceSize=128m -XX:+UseSerialGC"

COPY dist/ROOT.war $DEPLOYMENT_DIR/ROOT.war

EXPOSE 8080
