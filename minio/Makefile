CONTAINER_NAME ?= minio1

build:
	docker build . -t "minio/minio:$(shell grep VER minio.env | cut -d= -f2)"
run:
	CONTAINER_NAME=$(CONTAINER_NAME) ./start.sh
clean:
	docker rm -f $(CONTAINER_NAME)
