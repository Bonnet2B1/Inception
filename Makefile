up:
	@mkdir -p ~/data/v_wordpress
	@mkdir -p ~/data/v_mariadb
	@docker-compose -f srcs/docker-compose.yml up

upbuild:
	@docker-compose -f srcs/docker-compose.yml up --build

down:
	@docker-compose -f srcs/docker-compose.yml down
	@echo "Down"

clean: down
	@rm -rf ~/data/v_wordpress/*
	@rm -rf ~/data/v_mariadb/*
	@if [ $$(docker ps -q | wc -l) -gt 0 ]; then docker stop $$(docker ps -q); fi
	@if [ $$(docker ps -aq | wc -l) -gt 0 ]; then docker rm $$(docker ps -aq); fi
	@if [ $$(docker images -q | wc -l) -gt 0 ]; then docker rmi $$(docker images -q); fi
	@if [ $$(docker volume ls -q | wc -l) -gt 0 ]; then docker volume rm $$(docker volume ls -q); fi
	@docker system prune -f
	@echo "Cleaned"

re: clean up
