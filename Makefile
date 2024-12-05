RESET   := \033[0m
BOLD    := \033[1m
RED     := \033[31m
GREEN   := \033[32m
YELLOW  := \033[33m
BLUE    := \033[34m
CYAN    := \033[36m
MAGENTA := \033[35m
WHITE   := \033[37m

all: build

build: setup
	@echo "$(GREEN)-- Build en cours --$(RESET)"
	docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

setup:
	@echo "$(BLUE)-- Creation des dossiers --$(RESET)"
	mkdir -p /home/picatrai/data/website
	mkdir -p /home/picatrai/data/database
	sudo bash ./srcs/requirements/tools/setup.sh

re: fclean all

fclean: clean
	@echo "$(MAGENTA)-- Down des conteneurs en profondeurs --$(RESET)"
	docker compose -f ./srcs/docker-compose.yml down --remove-orphans
	docker compose -f ./srcs/docker-compose.yml down --volumes

clean: down

down:
	@echo "$(MAGENTA)-- Down des conteneurs --$(RESET)"
	docker compose -f ./srcs/docker-compose.yml down

prune:
	docker image prune -a --force

logs:
	@echo -n "$(CYAN)"
	docker logs mariadb
	@echo -n "$(GREEN)"
	docker logs wordpress
	@echo -n "$(YELLOW)"
	docker logs nginx
	@echo -n "$(RESET)"