include ./srcs/.env
export $(shell sed 's/=.*//' ./srcs/.env)

all:
	docker-compose -p $(NAME) -f srcs/docker-compose.yml up -d --build

clean:
	docker-compose -p $(NAME) -f srcs/docker-compose.yml down --rmi all --volumes
	sudo rm -fr ${VOLUME_PATH}