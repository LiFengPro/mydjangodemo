#!/bin/bash

python manage.py migrate
gunicorn mysite.wsgi -b 0.0.0.0:8000