all: cs test

.PHONY: composer coverage cs test unit integration

composer:
	php composer.phar validate --no-check-lock
	php composer.phar update

coverage: composer
	vendor/bin/phpunit --configuration test/Unit/phpunit.xml --coverage-text

cs:
	php vendor/bin/php-cs-fixer fix . -v --diff --config-file=.php_cs

test: unit

phpunit: composer
	php vendor/bin/phpunit

unit: composer phpunit
