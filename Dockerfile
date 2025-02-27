FROM alpine:3.21.3

RUN apk add --no-cache tzdata gcompat libxrender-0.9.11-r5
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

ENV PATH=/opt/apache-tomcat-9.0.100/bin:/opt/jre1.8.0_441/bin:$PATH
ENV JAVA_HOME=/opt/jre1.8.0_441
ENV CATALINA_HOME=/opt/apache-tomcat-9.0.100
ENV TOMCAT_NATIVE_LIBDIR=/opt/apache-tomcat-9.0.100/native-jni-lib
ENV LD_LIBRARY_PATH=/opt/apache-tomcat-9.0.100/native-jni-lib:/opt/jre1.8.0_441/lib/amd64/server

ADD apache-tomcat-9.0.100.tar.gz /opt
ADD jre-8u441-linux-x64.tar.bz2 /opt

ENTRYPOINT ["catalina.sh", "run"]
