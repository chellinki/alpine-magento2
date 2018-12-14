FROM alpine:3.6

RUN apk --update --no-cache add \
	varnish

COPY bin/startup.sh /usr/local/bin/startup.sh
COPY conf/default.vcl /etc/varnish/default.vcl

EXPOSE 80
WORKDIR /var/lib/varnish
CMD [ "sh", "/usr/local/bin/startup.sh" ]
