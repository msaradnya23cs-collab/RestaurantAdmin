FROM payara/micro:7.2026.1

COPY ROOT.war /opt/payara/deployments/ROOT.war

CMD ["--port", "${PORT}", "--deploy", "/opt/payara/deployments/ROOT.war"]
