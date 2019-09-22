FROM python:3.7

ENV PYTHONUNBUFFERED 1

RUN mkdir /usr/src/app

WORKDIR /usr/src/app

ADD . .

RUN [ ! -f /usr/src/app/requirements.txt ] || pip3 install -r requirements.txt

RUN chmod 744 /usr/src/app/scripts/django_init.sh

EXPOSE 3000

RUN [ ! -f /usr/src/app/manage.py ] && pip install -r requeriments.txt \
  && django-admin startproject products_api . \
  || python manage.py makemigrations && python manage.py migrate
