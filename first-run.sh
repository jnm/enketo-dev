#!/bin/bash
docker-compose run --rm kobocat ./manage.py migrate
docker-compose run --rm kpi ./manage.py migrate
docker-compose run --rm kpi ./manage.py createsuperuser
echo '%%%%%%%%%%%%%%'
echo '%% REMINDER %%'
echo '%%%%%%%%%%%%%%'
echo 'Always use a regular, non-superuser account for testing!'
echo 'Activation emails (and all emails!) should be written to'
echo 'the log output of the kpi container.'
