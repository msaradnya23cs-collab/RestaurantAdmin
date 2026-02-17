FROM payara/micro:5.2022.5-jdk11

COPY dist/ROOT.war /opt/payara/deployments/ROOT.war

EXPOSE 8080

CMD ["--deploymentDir", "/opt/payara/deployments", "--port", "8080"]
