FROM ubuntu:latest

RUN apt-get -qq update && apt-get -qq -y --no-install-recommends install sudo curl nano mc gawk systemctl openjdk-11-jdk && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

WORKDIR /app

COPY . .

RUN mkdir cs && tar -C cs -xzf 1c_cs_11.0.25_linux_x86_64.tar.gz* && sudo ./cs/1ce-installer-cli install && rm -r cs *.gz
#RUN sudo ./cs/1ce-installer-cli install
RUN sudo ./init.sh

