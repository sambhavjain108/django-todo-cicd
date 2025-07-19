FROM python:3

WORKDIR /data

COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt


# Install distutils for compatibility
RUN apt-get update && apt-get install -y python3-distutils

# Upgrade pip and setuptools to avoid missing dependencies
RUN pip install --upgrade pip setuptools

# Install Django
RUN pip install django==3.2 pytz

COPY . .

RUN python manage.py migrate
