FROM ubuntu:17.10 

RUN apt-get -y update 
RUN apt-get -y install xvfb iceweasel git
RUN apt-get -y install software-properties-common

ENV DEBIAN_FRONTEND "noninteractive"

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" > /etc/apt/sources.list.d/webupd8team-java.list 
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" >> /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && apt-get -y update


RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get -y install oracle-java8-installer --allow-unauthenticated

RUN useradd -ms /bin/bash runner

USER runner
WORKDIR /home/runner

ADD assets/run.sh /home/runner 
ENTRYPOINT [ "/home/runner/run.sh" ]
