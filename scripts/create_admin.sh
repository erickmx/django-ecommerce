docker-compose exec products_api sh -c 'python manage.py createsuperuser2 --no-input --email=$ADMIN_EMAIL --password=$ADMIN_PWD --username=$ADMIN_USER'