FROM payara/micro:5.2022.5-jdk11

COPY ROOT.war /opt/payara/deployments/ROOT.war

ENTRYPOINT ["java", "-jar", "/opt/payara/payara-micro.jar", "--deploy", "/opt/payara/deployments/ROOT.war", "--port", "8080"]
