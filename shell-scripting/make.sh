#!bin/bash

Docker_Compose := docker-compose
OS := $(shell uname)
ifeq ($(OS), Linux)
	@echo "Running in $(OS)"
else
ifeq ($(OS), Windows_NT)
	@echo "this is not for windows"

endif
build:
	$(Docker_Compose) build
up: 
	$(Docker_Compose) up -d
down:
	$(Docker_Compose) down
clean:
	docker system prune
