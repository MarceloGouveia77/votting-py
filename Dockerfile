# Base Image
FROM tiangolo/uvicorn-gunicorn:python3.8

# create and set working directory
WORKDIR /app

COPY ./app /app

# Add current directory code to working directory
COPY . ./app
# set default environment variables
ENV PYTHONUNBUFFERED 1

# set project environment variables
# grab these via Python's os.environ
# these are 100% optional here

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        tzdata \
        python3-setuptools \
        python3-pip \
        python3-dev \
        python3-venv \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 80

# install environment dependencies
RUN pip3 install --upgrade pip 
RUN pip3 install pipenv
RUN pip install --no-cache-dir fastapi

CMD uvicorn votting.asgi:application --reload --port 80