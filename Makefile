IS_RUNNING := $(shell docker inspect trufla_web 2>/dev/null | grep "Running" | xargs | sed "s/.$$//")
RUNNING = Running: true
$(if $(IS_RUNNING), $(info ### Trufla container ${IS_RUNNING} ###), $(info ### Trufla container Running: false ###))

build:
	docker-compose build --pull

up:
	docker-compose up --d

down:
	docker-compose down

destroy:
	docker-compose down -v

logs:
	docker-compose logs --follow $(filter-out $@,$(MAKECMDGOALS))

rake:
ifeq ($(IS_RUNNING), $(RUNNING))
	docker-compose exec web rake $(filter-out $@,$(MAKECMDGOALS))
else
	docker-compose run --rm web rake $(filter-out $@,$(MAKECMDGOALS))
endif

generate:
ifeq ($(IS_RUNNING), $(RUNNING))
	docker-compose exec web rails generate $(filter-out $@,$(MAKECMDGOALS))
else
	docker-compose run --rm web rails generate $(filter-out $@,$(MAKECMDGOALS))
endif

migrate:
ifeq ($(IS_RUNNING), $(RUNNING))
	docker-compose exec web rake db:migrate
else
	docker-compose run --rm web rake db:migrate
endif

rspec:
ifeq ($(IS_RUNNING), $(RUNNING))
	docker-compose exec web rspec
else
	docker-compose run --rm web rspec
endif

seed:
ifeq ($(IS_RUNNING), $(RUNNING))
	docker-compose exec web rake db:seed
else
	docker-compose run --rm web rake db:seed
endif

console:
ifeq ($(IS_RUNNING), $(RUNNING))
	docker-compose exec web rails console
else
	docker-compose run --rm web rails console
endif

shell:
ifeq ($(IS_RUNNING), $(RUNNING))
	docker-compose exec web bash
else
	docker-compose run --rm web bash
endif