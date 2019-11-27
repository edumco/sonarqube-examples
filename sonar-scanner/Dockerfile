FROM node:lts-slim

ENV SONAR_DOWNLOADS=https://binaries.sonarsource.com/Distribution/sonar-scanner-cli

ENV SONAR_VERSION=4.2.0.1873

ENV ZIP=sonar-scanner-cli-${SONAR_VERSION}.zip

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget ${SONAR_DOWNLOADS}/${ZIP} && \
    apt-get install -y unzip && \
    unzip /${ZIP} && \
    rm /${ZIP} && \
    apt-get purge -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    echo 'deb http://ftp.de.debian.org/debian sid main' >> '/etc/apt/sources.list' && \
    apt-get -y update && \
    mkdir -p /usr/share/man/man1 && \
    apt-get -y install openjdk-11-jre-headless && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

CMD export PATH=$PATH:/sonar-scanner-${SONAR_VERSION}/bin && bash