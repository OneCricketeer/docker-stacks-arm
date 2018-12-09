VOLUME ?= nexus-data
CONTAINER_NETWORK ?= devops

HOST_HTTP_PORT ?= 8081
HOST_DOCKER_PORT ?= 8082
TAG ?= 3.14.0


build:
	docker build . -t sonatype/nexus3:$(TAG)

run:
	docker run -d \
		-p $(HOST_HTTP_PORT):8081 \
		-p $(HOST_DOCKER_PORT):$(HOST_DOCKER_PORT) \
		--network $(CONTAINER_NETWORK) \
		-v $(VOLUME):/nexus-data \
		--name nexus \
		sonatype/nexus3:$(TAG)

stop:
	docker stop nexus

clean: stop
	docker rm -f nexus
