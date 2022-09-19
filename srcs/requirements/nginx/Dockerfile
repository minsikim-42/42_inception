FROM 	debian:buster

RUN 	apt-get update && apt-get -y upgrade \
		&& apt-get -y install nginx openssl vim \
		&& openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
			-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=42Seoul/CN=minsikim/EA=minsikim@naver.com" \
			-keyout inception.key -out inception.crt \
		&& mv inception.crt /etc/ssl/certs/ \
		&& mv inception.key /etc/ssl/private/

COPY	./conf/nginx.cnf /etc/nginx/sites-enabled/default

ENTRYPOINT	["nginx", "-g", "daemon off;"]

# req
# CA를 위한 자체 서명된 인증서 생성

# -newkey arg
# 새 인증서 요청 & 새 개인키 생성
# C: contry name (letter code)
# ST: state or province name (full name)
# L: locality name (city)
# O: organization name (company)
# OU: organization unit name (section)
# CN: common name
# EA: emain address

# -nodes
# 개인키가 생성되더라도 암호화되지 않음
# if this option is specified then if a private key is created it will not be encrypted.

# -subj arg
# 구성파일 지정 및 OPENSSL_CONF 파일 이름 재정의
# sets subject name for new request or supersedes the subject name when processing a request. The arg must be formatted as /type0=value0/type1=value1/type2=..., characters may be escaped by \ (backslash), no spaces are skipped.

# -x509
# CA, 인증서 요청대신 자체 서명된 인증서를 출력
# this option outputs a self signed certificate instead of a certificate request. This is typically used to generate a test certificate or a self signed root CA. The extensions added to the certificate (if any) are specified in the configuration file. Unless specified using the set_serial option, a large random number will be used for the serial number.

# If existing request is specified with the -in option, it is converted to the self signed certificate otherwise new request is created.

# -days n
# 유효일자
# when the -x509 option is being used this specifies the number of days to certify the certificate for. The default is 30 days.

# out arg
# 쓸 출력파일이름 재지정


# 자체 서명된 루트 인증서
#  openssl req -x509 -newkey rsa:2048 -keyout key.pem -out req.pem