# base image
FROM debian:buster

# dockerfile 작성자
MAINTAINER minsikim <spalstlr321@naver.com>

# image가 올라갔을 때 수행되는 명령어
RUN \
	apt-get update && apt-get -y upgrade && \
	apt-get install -y mariadb-server vim procps

COPY	./conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
COPY	./tools/entrypoint.sh /tmp/entrypoint.sh

RUN	chmod +x /tmp/entrypoint.sh

# 컨테이너 생성시 동작, PID 1로 강제 실행
ENTRYPOINT      ["./tmp/entrypoint.sh"]

# 접근 EXPOSE : docker-compose 