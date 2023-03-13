FROM python:3.8-slim

ENV PYTHONFAULTHANDLER=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONHASHSEED=random
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIP_DEFAULT_TIMEOUT=100

RUN apt-get update
RUN apt-get install -y python3 python3-pip python-dev build-essential python3-venv ffmpeg

# RUN apt-get install -y supervisor

# RUN apt-get install -y wget gnupg
# RUN wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -
# RUN echo "deb http://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" > /etc/apt/sources.list.d/mongodb-org-6.0.list
# RUN apt-get update; apt-get install -y mongodb-org

RUN mkdir -p /code
ADD . /code
WORKDIR /code

RUN pip3 install -r requirements.txt
# ADD supervisor.conf /code/
CMD ["python3", "bot/bot.py"]
# CMD ["supervisord", "-c", "/code/supervisor.conf"]
