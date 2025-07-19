FROM python:3

WORKDIR /data

RUN apt-get update && apt-get install -y python3-distutils

RUN pip install --upgrade pip setuptools

RUN pip install Django==3.2 pytz

COPY . .

RUN python manage.py migrate
