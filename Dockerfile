FROM postgres:17

USER root


RUN apt-get update && \
    apt-get install -y postgresql-17-pgaudit


USER postgres
