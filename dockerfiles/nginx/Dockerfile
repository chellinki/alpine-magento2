FROM alpine:3.6

RUN apk --update --no-cache add \
	shadow \
	openssl \
	nginx \
	varnish

RUN usermod -u 1000 nginx && \
	groupmod -g 1000 nginx

COPY ./bin/startup.sh /usr/local/bin/startup.sh
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/magento-2.conf /etc/nginx/available.d/magento-2.conf
COPY ./conf/default.vcl /etc/varnish/default.vcl

EXPOSE 80
WORKDIR /var/www/html
CMD [ "sh", "/usr/local/bin/startup.sh" ]
