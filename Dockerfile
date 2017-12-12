FROM ubuntu:17.10

RUN apt-get -y update
RUN apt-get -y install firefox xvfb openjdk-8-jdk

#COPY entrypoint.sh /tmp/
# ENTRYPOINT ["/tmp/entrypoint.sh"]

RUN useradd -u 842 -ms /bin/bash jenkins 
