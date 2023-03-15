DOCKER_COMPOSE_UP = docker-compose.yml up -d --build
DOCKER_COMPOSE_DOWN = docker-compose.yml down

docker.up:
	docker compose -f ${DOCKER_COMPOSE_UP}

docker.down:
	docker compose -f ${DOCKER_COMPOSE_DOWN}
