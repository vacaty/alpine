FROM alpine:3.4

RUN set -ex\
	&& addgroup -g 88 www && adduser -u 88 -DG www www \
	&& sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk add --no-cache su-exec curl zip wget tzdata \
	&& cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& apk del tzdata \
	&& mkdir -p /usr/local/var/log /usr/local/etc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
