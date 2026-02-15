FROM airhacks/glassfish

ENV JVM_ARGS="-Xms32m -Xmx128m -XX:MaxMetaspaceSize=64m -XX:+UseSerialGC"

# remove default ROOT if exists
RUN rm -rf /opt/glassfish/domains/domain1/autodeploy/ROOT*

# copy your app as ROOT
COPY dist/ROOT.war /opt/glassfish/domains/domain1/autodeploy/ROOT.war

EXPOSE 8080
