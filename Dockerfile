FROM python:3.5.3
RUN mkdir /code
WORKDIR /code
Add . /code/
RUN pip install -r requirements.txt
CMD ["gunicorn", "mysite.wsgi"]
