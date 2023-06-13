# todo: migrate to "alpine" image
FROM ubuntu:latest

RUN apt-get update && apt-get install -y cron python3 python3-pip jq curl

RUN mkdir /app

COPY ./../requirements.loc /app/requirements.loc
COPY ./docker/crontab.do /etc/cron.d/
COPY ./docker/entrypoint.sh /

RUN chmod +x /etc/cron.d/crontab.do
RUN chmod +x /entrypoint.sh

RUN crontab /etc/cron.d/crontab.do

WORKDIR /app

RUN pip install -r /app/requirements.loc

ENTRYPOINT ["/entrypoint.sh"]


