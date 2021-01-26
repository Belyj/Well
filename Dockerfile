FROM tomcat:9.0-jre8
ENV CATALINA_BASE   /usr/local/tomcat
ENV CATALINA_HOME   /usr/local/tomcat
ENV CATALINA_TMPDIR /usr/local/tomcat/temp
ENV JRE_HOME        /usr
ENV CLASSPATH       /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar
ENV PATH $CATALINA_HOME/bin:$PATH

COPY /Wellcomer-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/wellcomer.war
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY ./web/WEB-INF/context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY ./web/index.jsp /usr/local/tomcat/webapps/manager/wellcomer.jsp
COPY ./web/WEB-INF/web.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY tomcat-users.xml /usr/local/apache-tomcat-9.0/conf/
EXPOSE 8080
CMD ["catalina.sh", "run"]