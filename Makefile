include ./srcs/.env
export $(shell sed 's/=.*//' ./srcs/.env)

all:
	mkdir -p ${VOLUME_PATH}
	mkdir -p ${VOLUME_PATH_DB}
	mkdir -p ${VOLUME_PATH_WP}
	docker-compose -p $(NAME) -f srcs/docker-compose.yml up -d --build

clean:
	docker-compose -p $(NAME) -f srcs/docker-compose.yml down --rmi all --volumes
	sudo rm -fr ${VOLUME_PATH}

fclean: clean
	docker system prune --force --all