FROM payara/micro:5.2022.5-jdk11

COPY ROOT.war /opt/payara/deployments/ROOT.war

ENTRYPOINT ["/opt/payara/bin/startInForeground.sh"]

CMD ["--deploy", "/opt/payara/deployments/ROOT.war", "--port", "${PORT}", "--noCluster"]
