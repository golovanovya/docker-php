#Docker image php-fpm 7.3

Docker image php-fmp version 7.3 with installed pdo_mysql, pdo_sqlsrv, gd, xdebug extensions

Config xdebug with enviromnments XDEBUG_CONFIG="idekey=docker remote_host={IP_ADDRESS} remote_port=9000 remote_enable=on remote_handler=dbgp remote_autostart=1"