FROM 	debian:buster

RUN 	apt-get update && apt-get -y upgrade \
		&& apt-get -y install nginx openssl vim \
		&& openssl req -newkey rsa:4096 -days 30 -nodes -x509 \
			-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=42Seoul/CN=localhost/EA=spalstlr321@naver.com" \
			-keyout inception.key -out inception.crt \
		&& mv inception.crt /etc/ssl/certs/ \
		&& mv inception.key /etc/ssl/private/

COPY	./conf/nginx.conf /etc/nginx/sites-enabled/default

ENTRYPOINT	["nginx", "-g", "daemon off;"]