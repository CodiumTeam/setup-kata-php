.PHONY: tests dependencies coverage docker-build docker-tests docker-coverage
default:
	@printf "$$HELP"

# Local commands
dependencies:
	composer install

tests:
	./vendor/bin/phpunit --color=always

coverage:
	./vendor/bin/phpunit --coverage-text

# Docker commands
docker-build:
	docker build -t php-docker-bootstrap .
	@docker run --rm -v ${PWD}:/opt/project php-docker-bootstrap make dependencies

docker-tests:
	@docker run --rm -v ${PWD}:/opt/project php-docker-bootstrap make tests

docker-coverage:
	@docker run --rm -v ${PWD}:/opt/project php-docker-bootstrap make coverage

define HELP
# Local commands
	- make dependencies\tInstall the dependencies using composer
	- make tests\t\tRun the tests
	- make coverage\t\tRun the code coverage
# Docker commands
	- make docker-build\tCreates a PHP image with xdebug and install the dependencies
	- make docker-tests\tRun the tests on docker
	- make docker-coverage\tRun the code coverage
 Please execute "make <command>". Example make help

endef

export HELP
