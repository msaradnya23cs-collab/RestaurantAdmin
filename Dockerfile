FROM payara/server-full:5.2022.5

COPY ROOT.war /opt/payara/appserver/glassfish/domains/domain1/autodeploy/ROOT.war
