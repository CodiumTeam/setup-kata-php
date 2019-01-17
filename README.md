# PHP and PHPUnit Kata Bootstrap

## TL;DR
I already have installed PHP 7 and composer

    make dependencies
    make tests
    make coverage

I already have installed docker

    make docker-build
    make docker-tests
    make docker-coverage

## Goal
- Simplify the setup of a PHP environment for katas
- Tests running in seconds
- Setup with or without docker
- Tutorial to run the tests inside PhpStorm
 
## Content
- PHP 7.2
- PHPUnit 7 (Compatible with PHP 7.1, 7.2 and 7.3)
- First PHPUnit test
- Phpstorm settings

# 0. Prerequisites
- [Docker](https://docs.docker.com/engine/installation/)
- [PhpStorm](https://www.jetbrains.com/phpstorm/download) with docker support (>= 2016.3) Optional

# 1. Prepare the setup
## With docker
    make docker-build

## Without docker

    make dependencies
    
# 2. Tests
## Command line with docker
    make docker-tests
## Command line without docker
    make tests
## PHPStorm with docker
### Configure docker
Follow the instructions according your [operating system](https://blog.jetbrains.com/phpstorm/2015/10/docker-support-in-phpstorm/)

In linux is:

    Open: Preferences
    Click: Build, execution, deployment | Docker
    Click: +
    Write: API Url: unix:///var/run/docker.sock
    Write: Docker compose executable: /usr/local/bin/docker-compose 

In Mac is:

    Open: Preferences
    Click: Build, execution, deployment | Docker
    Click: +
    Click: Docker for Mac
### Configure Interpreter
    Click: Languages & Frameworks | PHP 
    Click: CLI Interpreter | ...
    Click: + | Remote
    Write: Name: Docker PHP 7.2
    Select: Remote | Docker
    Write: Image name: php-docker-bootstrap
    Write: General executanble: php
### Configure PHPUnit
    Click: Languages & Frameworks | PHP | PHPUnit 
    Click: + | By Remote Interpreter
    Select: Cli interpreter: Docker PHP 7.2
    Click: PHP Unit library: Use composer autoloader
    Write: Path to script: vendor/autoloader.php
    Write: Default configuration file: phpunit.xml.dist
### Run
    Right click: tests folder | Run 'tests'

# 3. Code coverage
## Command line with docker
    make docker-coverage
## Command line without docker
    make coverage
##  PHPStorm 
    Right click: tests folder | Run 'tests with Coverage'
# 4. Use another PHP Version
If you want to use other version of PHP it's as easy as follow the steps:
- Edit Dockerfile
- Select a valid version of PHP from [Docker Hub](https://hub.docker.com/_/php/)
- Follow the "Prepare setup" steps
- Validate the composer.json to verify all the requisites are satisfied.