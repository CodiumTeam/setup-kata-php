# PHP and PHPUnit Bootstrap with docker

## Goal
- Simplify the setup of a PHP environment
- Use at the same time different versions of PHP 
## Content
- PHP 7.1.2
- PHPUnit 5.7 (Compatible with PHP 5.6, PHP 7.0, and PHP 7.1)
- First PHPUnit test
- Phpstorm settings

# 0. Prerequisites
- [Docker](https://docs.docker.com/engine/installation/)
- [PhpStorm](https://www.jetbrains.com/phpstorm/download) with docker support (>= 2016.3) Optional

# 1. Prepare the setup
## 1.1. Build the image
    docker build -t my-php .
## 1.2. Install the composer dependencies
    docker run -v YOUR_PROJECT_FULLPATH/:/opt/project my-php composer install
# 2. Run the tests
## 2.1. From command line
    docker run -v YOUR_PROJECT_FULLPATH/:/opt/project my-php ./vendor/bin/phpunit
## 2.2. From PHPStorm
### 2.2.1. Configure docker
Follow the instructions according your [operating system](https://blog.jetbrains.com/phpstorm/2015/10/docker-support-in-phpstorm/)

In linux is:

    Click: Build, execution, deployment | Docker
    Click: +
    Write: API Url: unix:///var/run/docker.sock
    Write: Docker compose executable: /usr/local/bin/docker-compose 
### 2.2.2. Configure Interpreter
    Click: Languages & Frameworks | PHP 
    Click: CLI Interpreter | ...
    Click: + | Remote
    Write: Name: Docker PHP 7.1.2
    Select: Remote | Docker
    Write: Image name: my-php
    Write: General executanble: php
### 2.2.3. Configure PHPUnit
    Click: Languages & Frameworks | PHP | PHPUnit 
    Click: + | By Remote Interpreter
    Select: Cli interpreter: Docker PHP 7.1.2
    Click: PHP Unit library: Use composer autoloader
    Write: Path to script: vendor/autoloader.php
### 2.2.4. Run
    Right click: tests folder | Run 'tests'
# 3. Change the PHP Version
If you want to use other version of PHP it's as easy as follow the steps:
- Edit Dockerfile
- Select a valid version of PHP from [Docker Hub](https://hub.docker.com/_/php/)
- Follow the "Prepare setup" steps
- Validate the composer.json to verify all the requisites are satisfied.