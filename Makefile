YELLOW := "\033[1;33m"
GREEN := "\033[1;32m"
END := "\033[0m"

COMPOSE_FILE=docker-compose.yaml
ENV_FILE=.env

include .env
export

.PHONY: all build down re clean fclean

all: build

build:
	@echo $(YELLOW) "\n\tCreating direcories for ${LABLE}...\n" ${END}
	@bash tools/make_dir.sh
	@echo $(GREEN) "\n\tDiretories for ${LABLE} are created\n" ${END}
	@echo $(YELLOW) "\n\tBuild ${LABLE}...\n" ${END}
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d --build
	@echo $(GREEN) "\n\tBuild ${LABLE}: done\n" ${END}

up:
	@echo $(YELLOW) "\n\tLaunch ${LABLE}...\n" ${END}
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d
	@echo $(GREEN) "\n\tLaunch ${LABLE}: done\n" ${END}

down:
	@echo $(YELLOW) "\n\tStop ${LABLE}...\n" ${END}
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down
	@echo $(GREEN) "\n\tStop ${LABLE}: done\n" ${END}

re: down all

clean:
	@echo $(YELLOW) "\n\tCleaning up ${LABLE} objects...\n" ${END}
	@docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down --volumes --remove-orphans
	@docker images --format "{{.Repository}}:{{.Tag}}" | grep ${IMAGE_TAG} | xargs -r docker rmi
	@bash tools/delete_dir.sh
	@echo $(GREEN) "\n\tClean up ${LABLE}: done\n" ${END}

fclean: clean
	@echo $(YELLOW) "\n\tCleaning up cache objects...\n" ${END}
	@docker system prune -f
	@echo $(GREEN) "\n\tClean up cache: done\n" ${END}
