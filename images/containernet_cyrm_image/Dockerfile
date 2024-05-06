FROM containernet/containernet
LABEL maintainer=”RafaelPinheiro”
LABEL maintainer=”rafaelpinheiro.380@alu.ufc.br”
RUN apt update -y
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install tshark          
CMD ["/bin/sh"]
