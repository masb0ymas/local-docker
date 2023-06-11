DOCKER_COMPOSE_UP = docker-compose.yml up -d --build
DOCKER_COMPOSE_DOWN = docker-compose.yml down

.PHONY: network.localhost
network.localhost:
	docker network create localhost-network

.PHONY: docker.up
docker.up:
	docker compose -f ${DOCKER_COMPOSE_UP}

.PHONY: docker.down
docker.down:
	docker compose -f ${DOCKER_COMPOSE_DOWN}
