THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: build up deploy upscale start down destroy stop restart cluster

build:
	cp sample.env .env
	docker-compose build $(c)
up:
	docker-compose up -d $(c)
deploy:
	cp sample.env .env
	docker-compose build $(c)
	docker-compose up -d $(c)
upscale:
	docker-compose up -d --scale backend=$(backend)
start:
	docker-compose start $(c)
down:
	docker-compose down $(c)
destroy:
	docker-compose down -v $(c)
stop:
	docker-compose stop $(c)
restart:
	docker-compose stop $(c)
	docker-compose up -d $(c)
cluster:
	ansible-playbook playbook.yml
