FROM ubuntu:latest
LABEL maintainer=”RafaelPinheiro”
LABEL maintainer=”rafaelpinheiro.380@alu.ufc.br”
RUN apt update -y
RUN apt install -y \ 
	bash \
	net-tools \
	iputils-ping \
	iproute2 \
	smbclient \	
	tshark \
	ssh
RUN apt-get install geoip-bin geoip-database -y
CMD ["/bin/sh"]

