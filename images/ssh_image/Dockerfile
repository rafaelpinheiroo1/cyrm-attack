FROM alpine:latest
LABEL maintainer="RafaelPinheiro"
LABEL maintainer=”rafaelpinheiro.380@alu.ufc.br”
RUN apk add --update --no-cache openssh \
	bash \
	tcpdump \
	iperf \
	busybox-extras \
	iproute2 \
	iputils 
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN adduser -h /home/tech -s /bin/sh -D tech
RUN echo -n 'tech:123tech' | chpasswd
RUN echo -n 'root:root123' | chpasswd
RUN apk add --no-cache syslog-ng
RUN /usr/bin/ssh-keygen -A 
RUN ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_key
EXPOSE 22
COPY start.sh /
CMD ["/bin/sh","-c","/start.sh"]
