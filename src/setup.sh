#!/bin/bash
echo "hello world"

service mariadb start

mariadb < ./src/sql/init.sql

 $(cd ./src/HCAR/ && python manage.py runserver &)
