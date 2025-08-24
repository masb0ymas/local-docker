DOCKER_COMPOSE_UP = docker-compose.dev.yml up -d --build
DOCKER_COMPOSE_DOWN = docker-compose.dev.yml down

# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' $(MAKEFILE_LIST) | column -t -s ':' |  sed -e 's/^/ /'

# ==================================================================================== #
# CONFIG
# ==================================================================================== #

## secret: generate secrets and put them in the .env file
.PHONY: secret
secret:
	chmod +x secret.sh
	bash secret.sh

# ==================================================================================== #
# PODMAN
# ==================================================================================== #

## podman/network: run podman network create
.PHONY: podman/network
podman/network:
	podman network create local-network

## podman/up: run podman up
.PHONY: podman/up
podman/up:
	podman compose -f ${DOCKER_COMPOSE_UP}

## podman/down: run podman down
.PHONY: podman/down
podman/down:
	podman compose -f ${DOCKER_COMPOSE_DOWN}

# ==================================================================================== #
# DOCKER
# ==================================================================================== #

## docker/network: run docker network create
.PHONY: docker/network
docker/network:
	docker network create local-network

## docker/up: run docker up
.PHONY: docker/up
docker/up:
	docker compose -f ${DOCKER_COMPOSE_UP}

## docker/down: run docker down
.PHONY: docker/down
docker/down:
	docker compose -f ${DOCKER_COMPOSE_DOWN}
