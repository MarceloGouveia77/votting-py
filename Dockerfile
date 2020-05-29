# Base Image
FROM python:3.8.2

# create and set working directory
WORKDIR /app
# Add current directory code to working directory
COPY . /app
# set default environment variables
ENV PYTHONUNBUFFERED 1
ENV REDIS_URL = '0.0.0.0'
# set project environment variables
# grab these via Python's os.environ
# these are 100% optional here

# Install system dependencies

RUN rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

# install environment dependencies
RUN pip3 install --upgrade pip

CMD uvicorn votting.asgi:application --reload --port 80 --host 0.0.0.0 && python manage.py runworker channels --settings=votting.settings 