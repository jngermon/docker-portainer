.PHONY: help install start stop
.DEFAULT_GOAL := help

install: docker-compose.yml ## Install

docker-compose.yml:
	cp docker-compose.yml.dist $@

start: install ## Run with docker stack
	docker stack deploy --compose-file docker-compose.yml portainer

stop: install ## Stop service
	docker stack rm portainer

help:
	@grep -E '^[a-zA-Z_-.]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
