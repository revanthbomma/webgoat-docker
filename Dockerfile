FROM enoniccloud/java6

# alternate  java method disabled: download local jdk
#ADD jdk-1_5_0_22-linux-amd64.bin /tmp/

# install java
#RUN \
#    echo yes|sh /tmp/jdk-1_5_0_22-linux-amd64.bin ;\
#    rm /tmp/jdk-1_5_0_22-linux-amd64.bin

#ENV JAVA_HOME /jdk1.5.0_22
#ENV PATH /jdk1.5.0_22/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN apt-get update && apt-get install -y wget zip unzip

#WORKDIR /usr/src/app

RUN wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/webgoat/WebGoat-5.4-OWASP_Standard_Win32.zip

RUN unzip WebGoat-5.4-OWASP_Standard_Win32.zip

EXPOSE 8080
EXPOSE 80
EXPOSE 9090

ENV WEBGOAT_PORT 8080
ENV WEBGOAT_SSLENABLED false

ENV GOATURL https://127.0.0.1:$WEBGOAT_PORT

#WORKDIR /

#RUN cd /usr/src/app/WebGoat-5.4

COPY "./start.sh" "./start.sh"
COPY "./env.sh" "./env.sh"
COPY "./webgoat-custom.sh" "./WebGoat-5.4/webgoat-custom.sh"
RUN chmod +x ./WebGoat-5.4/webgoat-custom.sh
RUN chmod +x start.sh
RUN chmod +x env.sh

#ENV JAVA_HOME="/jdk1.5.0_22"
#ENV PATH="$PATH:$JAVA_HOME/bin"

ENTRYPOINT ["./start.sh"]
