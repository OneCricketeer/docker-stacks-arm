#!/usr/bin/env bash

set -eu

. minio.env
: ${HOST_PORT:=9001}
: ${CONTAINER_NAME:=minio1}
entrypoint='server /data'

if [ ! -d `pwd`/data ]; then
  mkdir data
fi

if [ ! -d `pwd`/config ]; then
  mkdir config
fi

docker run \
	-p ${HOST_PORT}:9000 \
	-e MINIO_ACCESS_KEY=${MINIO_ACCESS_KEY} \
	-e MINIO_SECRET_KEY=${MINIO_SECRET_KEY} \
	-v `pwd`/data:/data \
	-v `pwd`/config:/root/.minio \
	--name "${CONTAINER_NAME}" \
	minio/minio:${MINIO_VERSION} $entrypoint
