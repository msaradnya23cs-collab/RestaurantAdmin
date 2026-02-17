FROM payara/micro:5.2022.5-jdk11

COPY ROOT.war $DEPLOY_DIR

CMD ["java", "-jar", "/opt/payara/payara-micro.jar", "--deploy", "/opt/payara/deployments/ROOT.war", "--port", "10000", "--contextRoot", "/"]
