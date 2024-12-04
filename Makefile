all: build

build: setup
	docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up --build

setup:
	mkdir -p /home/picatrai/data/website
	mkdir -p /home/picatrai/data/database
	sudo bash ./srcs/requirements/tools/setup.sh

re: fclean all

fclean: clean
	docker compose -f ./srcs/docker-compose.yml down --remove-orphans
	docker compose -f ./srcs/docker-compose.yml down --volumes

clean: down

down:
	docker compose -f ./srcs/docker-compose.yml down

