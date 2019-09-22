from django.contrib.auth.models import User
from django.core.management.base import BaseCommand
from django.core.management import CommandError
# from django.contrib.auth.models import DoesNotExist


class Command(BaseCommand):
    help = 'Deletes the superuser with the gived argument if exists many, else deletes the unique superuser'

    def add_arguments(self, parser):
        parser.add_argument('--username', dest='username',
                            type=str, help='The admin\'s username')

    def handle(self, *args, **options):
        username = options.get('username')

        if not username:
            raise CommandError(
                '--username is required to delete the admin.'
            )
        try:
            User.objects.get(
                username=username, is_superuser=True).delete()
        except User.DoesNotExist as err:
            raise CommandError(
                'User matching query does not exist.'
            )
