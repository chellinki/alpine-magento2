FROM alpine:3.6

RUN apk --update --no-cache add \
	shadow \
	openssl \
	nginx

RUN usermod -u 1000 nginx && \
	groupmod -g 1000 nginx

RUN mkdir -p /var/www/ssl && \
	openssl req \
		-x509 \
		-nodes \
		-days 365 \
		-newkey rsa:2048 \
		-out /var/www/ssl/nginx.crt \
		-keyout /var/www/ssl/nginx.key \
		-subj "/C=US/ST=IL/L= /O= /OU= /CN= "

COPY ./bin/startup.sh /usr/local/bin/startup.sh
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
#COPY ./conf/https.conf /etc/nginx/conf.d/https.conf
COPY ./conf/magento-2.conf /etc/nginx/available.d/magento-2.conf

EXPOSE 80
WORKDIR /var/www/html
CMD [ "sh", "/usr/local/bin/startup.sh" ]
