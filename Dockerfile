FROM airhacks/glassfish

COPY dist/RestaurantAdmin.war /opt/glassfish7/glassfish/domains/domain1/autodeploy/

EXPOSE 8080

CMD ["asadmin", "start-domain", "-v"]
