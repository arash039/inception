RED=\033[0;31m
GREEN=\033[0;32m
NO_COLOR=\033[0m

all : up

build:
	docker compose -f ./srcs/docker-compose.yml build --no-cache && docker compose -f ./srcs/docker-compose.yml up -d

up : 
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

status : 
	docker ps

clean : 
	docker compose -f ./srcs/docker-compose.yml down
	@if [ -n "$$($$(docker images -a -q))" ]; then \
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
	$$(echo 'woody31039' | sudo -S rm -rf /home/arash/Desktop/inception/volumes/mariadb/*)
	$$(echo 'woody31039' | sudo -S rm -rf /home/arash/Desktop/inception/volumes/wordpress/*)

clean_build :
	docker builder prune -f

re : full_clean all
