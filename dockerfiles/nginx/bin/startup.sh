#!/usr/bin/env sh

if [[ "$MAGENTO_VERSION" != "1" ]] && [[ "$MAGENTO_VERSION" != "2" ]]; then
	echo "Valid value for MAGENTO_VERSION is not found ... using default value 2"
	MAGENTO_VERSION="2"
fi

if [[ "$VERBOSE" == "true" ]]; then
	mkdir -p /var/log/nginx
	touch /var/log/nginx/error.log /var/log/nginx/access.log
	tail -f /var/log/nginx/*.log &
fi

cp "/etc/nginx/available.d/magento-$MAGENTO_VERSION.conf" "/etc/nginx/conf.d/http.conf"
mv "/etc/nginx/conf.d/default.conf" "/etc/nginx/conf.d/default.conf-bu"
chown -R nginx:nginx /var/www /var/tmp/nginx
nginx -g 'daemon off;'
varnishd -a ':81' -T 'localhost:6082' -f '/etc/varnish/default.vcl' -p 'http_resp_hdr_len=65536' -p 'http_resp_size=98304' -p 'vcc_allow_inline_c=on' -p 'workspace_backend=128k' -p 'workspace_client=128k' -s 'malloc,1G'
