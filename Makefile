include ./srcs/.env
export $(shell sed 's/=.*//' ./srcs/.env)

all:
	docker-compose -p $(NAME) -f srcs/docker-compose.yml up -d --build
