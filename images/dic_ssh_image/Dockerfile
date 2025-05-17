FROM alpine:latest
LABEL maintainer=”RafaelPinheiro”
LABEL maintainer=”rafaelpinheiro.380@alu.ufc.br”
RUN apk update
RUN apk add bash \
        nano \
        openssh \
        tcpdump \
        iperf \
        busybox-extras \
        iproute2 \
        iputils
RUN apk --no-cache --update add build-base
RUN apk add git
RUN git clone https://github.com/vanhauser-thc/thc-hydra
RUN apk add libssh-dev
RUN cd /thc-hydra/ && ./configure
RUN cd /thc-hydra/ && make
RUN cd /thc-hydra/ && make install
CMD ["/bin/sh"]
