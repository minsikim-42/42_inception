# base image
FROM debian:buster

# dockerfile 작성자
MAINTAINER minsikim <spalstlr321@naver.com>

# image가 올라갔을 때 수행되는 명령어
RUN \
	apt-get update && apt-get -y upgrade && \
	apt-get install -y mariadb-server vim procps

# COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY	./tools/entrypoint.sh /tmp/entrypoint.sh

RUN	chmod +x /tmp/entrypoint.sh

# 접근 EXPOSE : docker-compose 