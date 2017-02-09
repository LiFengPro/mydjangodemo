#!/bin/bash

python manage.py migrate
/usr/local/bin/gunicorn mysite.wsgi