FROM airhacks/glassfish

COPY dist/ROOT.war $DEPLOYMENT_DIR

EXPOSE 8080
