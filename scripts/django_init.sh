#!/bin/sh
echo "okay"
if [ ! -f /usr/src/app/manage.py ]; then
    pip3 -r requirements.txt
    django-admin startproject products_api .
    python3 manage.py runserver 0.0.0.0:3000
else 
    python3 manage.py makemigrations
    python3 manage.py migrate
    python3 manage.py runserver 0.0.0.0:3000
fi