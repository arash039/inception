RED=\033[0;31m
GREEN=\033[0;32m
NO_COLOR=\033[0m

DOCKER_COMPOSE_PATH="./srcs/docker-compose.yml"
all : up

build:
	docker compose -f ./srcs/docker-compose.yml build --no-cache && docker compose -f ./srcs/docker-compose.yml up -d

up :
	@$$(cp /home/arash/.env ./srcs)
	@$$(mkdir -p /home/arash/data/mariadb)
	@$$(mkdir -p /home/arash/data/wordpress)
	@docker compose -f ./srcs/docker-compose.yml up -d
	@if [ $$? -eq 0 ]; then \
		echo "                                 $(RED)INCEPTION IS READY$(NO_COLOR)"; \
	else \
		echo "The compose failed to execute."; \
	fi

down : 
	docker compose -f ./srcs/docker-compose.yml down

stop : 
	docker compose -f ./srcs/docker-compose.yml stop

start : 
	docker compose -f ./srcs/docker-compose.yml start

clean : 
	docker compose -f ./srcs/docker-compose.yml down
	@if [ -n "$$(docker images -a -q)" ]; then \
		docker rmi -f $$(docker images -a -q); \
	else \
		echo "No images to remove"; \
	fi
	@if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume rm -f $$(docker volume ls -q); \
	else \
		echo "No volumes to remove"; \
	fi

full_clean : clean
	docker system prune -a --volumes -f
	docker volume prune -f
	$$(echo '12345' | sudo -S rm -rf /home/arash/data/mariadb/*)
	$$(echo '12345' | sudo -S rm -rf /home/arash/data/wordpress/*)

clean_build :
	docker builder prune -f

generate:
	@$$(chmod +x ./credentials.sh)
	@bash credentials.sh
	if [ $$? -eq 99 ]; then \
		echo ".env file exist!"; \
	fi

re : full_clean all

bonus: bonus_up

bonus_up :
	@$$(cp /home/arash/.env ./srcs)
	@$$(mkdir -p /home/arash/data/mariadb)
	@$$(mkdir -p /home/arash/data/wordpress)
	@docker compose -f ./srcs/docker-compose-bonus.yml up -d
	@if [ $$? -eq 0 ]; then \
		echo "                                 $(RED)INCEPTION IS READY$(NO_COLOR)"; \
	else \
		echo "The compose failed to execute."; \
	fi

bonus_down : 
	docker compose -f ./srcs/docker-compose-bonus.yml down

bonus_stop : 
	docker compose -f ./srcs/docker-compose-bonus.yml stop

bonus_start : 
	docker compose -f ./srcs/docker-compose-bonus.yml start

bonus_clean : 
	docker compose -f ./srcs/docker-compose-bonus.yml down
	@if [ -n "$$(docker images -a -q)" ]; then \
		docker rmi -f $$(docker images -a -q); \
	else \
		echo "No images to remove"; \
	fi
	@if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume rm -f $$(docker volume ls -q); \
	else \
		echo "No volumes to remove"; \
	fi

bonus_full_clean : bonus_clean
	docker system prune -a --volumes -f
	docker volume prune -f
	$$(echo '12345' | sudo -S rm -rf /home/arash/data/mariadb/*)
	$$(echo '12345' | sudo -S rm -rf /home/arash/data/wordpress/*)
