# Makefile

# Include .env file
ifneq (,$(wildcard ./.env))
	include .env
	export
endif

# Build the Docker image
build:
	docker build --build-arg PORT=$(CONTAINER_PORT) -t $(DOCKER_IMAGE_NAME) .

# Run the Docker container
run:
	docker run -t -d -p $(MACHINE_PORT):$(CONTAINER_PORT) --name $(DOCKER_CONTAINER_NAME) $(DOCKER_IMAGE_NAME)

# Stop and remove the Docker container
stop:
	docker stop $(DOCKER_CONTAINER_NAME)
	docker rm $(DOCKER_CONTAINER_NAME)

# Clean up the Docker image
clean:
	docker rmi $(DOCKER_IMAGE_NAME)
