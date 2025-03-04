DOCKER_COMPOSE_UP = docker-compose.dev.yml up -d --build
DOCKER_COMPOSE_DOWN = docker-compose.dev.yml down

.PHONY: secret
secret:
	chmod +x secret.sh
	bash secret.sh

.PHONY: podman.network
podman.network:
	podman network create local-network

.PHONY: podman.up
podman.up:
	podman compose -f ${DOCKER_COMPOSE_UP}

.PHONY: podman.down
podman.down:
	podman compose -f ${DOCKER_COMPOSE_DOWN}

.PHONY: docker.network
docker.network:
	docker network create local-network

.PHONY: docker.up
docker.up:
	docker compose -f ${DOCKER_COMPOSE_UP}

.PHONY: docker.down
docker.down:
	docker compose -f ${DOCKER_COMPOSE_DOWN}
