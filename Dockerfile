# Base Image
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

# create and set working directory
WORKDIR /app

# Add current directory code to working directory

# set default environment variables
ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive 

# set project environment variables
# grab these via Python's os.environ
# these are 100% optional here
ENV PORT=8000

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

COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

# install environment dependencies
RUN pip3 install --upgrade pip 
RUN pip3 install pipenv

CMD uvicorn votting.asgi:application --reload --port 8888