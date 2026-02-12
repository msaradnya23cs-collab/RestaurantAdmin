FROM payara/micro:5.2022.5

COPY ROOT.war /opt/payara/app.war

CMD ["--deploy", "/opt/payara/app.war", "--contextroot", "/", "--port", "8080", "--host", "0.0.0.0"]
