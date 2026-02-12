FROM payara/micro:5.2022.5

COPY ROOT.war /opt/payara/ROOT.war

CMD ["--deploy", "/opt/payara/ROOT.war", "--port", "8080"]
