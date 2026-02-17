FROM payara/micro:5.2022.5-jdk11

COPY ROOT.war $DEPLOY_DIR/ROOT.war

EXPOSE 8080

CMD ["--deploy", "/opt/payara/deployments/ROOT.war", "--contextroot", "/"]
