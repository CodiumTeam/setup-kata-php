# PHP and PHPUnit Bootstrap with docker
In order to speed up the setup for katas or projects I have created this repository with:

- PHP 7.1.2
- PHPUnit 5.7
- First PHPUnit test
- Phpstorm settings

# Prerequisites
- [Docker](https://docs.docker.com/engine/installation/)
- [PhpStorm](https://www.jetbrains.com/phpstorm/download) Optional

# Prepare the setup
## Build the image
    docker build -t my-php .
## Install the dependencies
    docker run -v YOUR_PROJECT_FULLPATH/:/opt/project my-php composer install
# Run the tests
## From command line
    docker run -v YOUR_PROJECT_FULLPATH/:/opt/project my-php ./vendor/bin/phpunit
## From PHPStorm
### Configure Interpreter
    Click: Languages & Frameworks | PHP 
    Click: CLI Interpreter | ...
    Click: + | Remote
    Write: Name: Docker PHP 7.1.2
    Select: Remote | Docker
    Write: Image name: my-php
    Write: General executanble: php
### Configure PHPUnit
    Click: Languages & Frameworks | PHP | PHPUnit 
    Click: + | By Remote Interpreter
    Select: Cli interpreter: Docker PHP 7.1.2
    Click: PHP Unit library: Use composer autoloader
    Write: Path to script: vendor/autoloader.php
### Run

    