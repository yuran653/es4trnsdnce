name = inception

YELLOW := "\033[1;33m"
GREEN := "\033[1;32m"
END := "\033[0m"

COMPOSE_FILE=srcs/docker-compose.yml
ENV_FILE=.env

include .env
export

.PHONY: all build down re clean fclean

all:
	@echo $(YELLOW) "\n\tBuild ${name}...\n" ${END}
	@bash srcs/requirements/tools/make_dir.sh
	@docker-compose -f $(COMPOSE_FILE) up -d --build
	@echo $(GREEN) "\n\tBuild ${name}: done\n" ${END}

up:
	@echo $(YELLOW) "\n\tLaunch ${name}...\n" ${END}
	@docker-compose -f $(COMPOSE_FILE) up -d
	@echo $(GREEN) "\n\tLaunch ${name}: done\n" ${END}

down:
	@echo $(YELLOW) "\n\tStop ${name}...\n" ${END}
	@docker-compose -f $(COMPOSE_FILE) down
	@echo $(GREEN) "\n\tStop ${name}: done\n" ${END}

re: down all

clean:
	@echo $(YELLOW) "\n\tCleaning up ${name} objects...\n" ${END}
	@docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	@docker images --format "{{.Repository}}:{{.Tag}}" | grep ${IMAGE_TAG} | xargs -r docker rmi
	@bash srcs/requirements/tools/delete_dir.sh
	@echo $(GREEN) "\n\tClean up ${name}: done\n" ${END}

fclean: clean
	@echo $(YELLOW) "\n\tCleaning up cache objects...\n" ${END}
	@docker system prune -f
	@echo $(GREEN) "\n\tClean up cache: done\n" ${END}
