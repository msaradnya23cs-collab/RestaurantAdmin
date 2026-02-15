FROM airhacks/glassfish

COPY dist/ROOT.war /opt/glassfish7/glassfish/domains/domain1/autodeploy/

EXPOSE 8080

CMD ["asadmin", "start-domain", "-v"]
