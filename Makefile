DOCKER_IMAGE=dockette/ffmegapeg
DOCKER_PLATFORM=linux/amd64

.PHONY: build test run docker-build
build: docker-build

test:
	docker run --rm ${DOCKER_IMAGE} ffmpeg -version
	docker run --rm ${DOCKER_IMAGE} ffprobe -version

run:
	docker run --rm -it ${DOCKER_IMAGE}

docker-build:
	docker buildx \
		build \
		--platform ${DOCKER_PLATFORM} \
		--pull \
		--load \
		-t ${DOCKER_IMAGE} \
		.
