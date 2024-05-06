FROM alpine:latest
LABEL maintainer=”RafaelPinheiro”
LABEL maintainer=”rafaelpinheiro.380@alu.ufc.br”
RUN apk update
RUN apk add bash \
        tcpdump \
        iperf \
        busybox-extras \
        iproute2 \
        iputils
RUN apk add hping3 --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
CMD ["/bin/sh"]
