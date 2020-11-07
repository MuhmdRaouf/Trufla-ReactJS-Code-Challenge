# Trufla ReactJS Code Challenge

This is instruction for how to get this application up and running.

Dependencies:

* Docker
* Docker-compose
* GNU Make

Instructions:
 - `make build` build application images.
 - `make up` might take couple minutes due yarn files integrity check. 
 - `make rake db:create` to create both development and test database.
 - `make migrate` to run the app migration.
 - `make seed` if you needed seed data.
 - `make rspec` to run run tests suite.

Instructions:

* make < commands > [additions commands]

Commands:
* build: build docker images
* up: start application
* down: stop application
* destroy: stop application and delete all containers
* logs: show containers logs eg. `make logs web` no additional commands will show all containers logs.
* rake: run rakes commands. eg. `make rake db:create`
* generate: run rails generate commands eg. `make generate model example`
* migrate: run rails migrations
* rspec: run rails test suite
* seed: seed some dummy data
* console: launch rails IRB console 
* shell: launch rails bash shell inside rails containers
