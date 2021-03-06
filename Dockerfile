FROM ubuntu:xenial
LABEL maintainer "Angelo Manganiello <angelo.mang@libero.it>"

#avoid interactive dialouges from apt:
ENV DEBIAN_FRONTEND noninteractive

#add repo, update, install jdk & jce extensions, set as default:
RUN apt update && apt -y install software-properties-common && \
	add-apt-repository ppa:webupd8team/java && \
	apt update && \
	echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
	apt -y install oracle-java9-installer && \
	apt -y install oracle-java9-unlimited-jce-policy && \
	apt -y install oracle-java9-set-default && \
        apt -y full-upgrade && \
	apt clean && \
        apt autoclean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	find /var/cache/ -type f -delete

#make sure future images are always updated:
ONBUILD RUN apt update && \
		apt -y full-upgrade && \
		apt clean && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
find /var/cache/ -type f -delete
