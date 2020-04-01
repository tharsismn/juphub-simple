FROM python:3.6.10-alpine3.10

#JUPYTERHUB VERSION
ARG JUPYTERHUB_VERSION=1.1.0
ARG W_DIR=/jupyterhub
ARG NOTEBOOK_PATH=/notebooks
ARG PACK_APK="build-base libffi-dev openssl-dev musl-dev npm nodejs unixodbc-dev"

#CREATE PATHS
RUN mkdir -p ${NOTEBOOK_PATH}

#PATH TO INSTALL JUP
RUN mkdir -p ${W_DIR}
WORKDIR ${W_DIR}

#INSTALL ALPINE PACKS
RUN apk update
RUN apk add --update --virtual .build-deps ${PACK_APK}
RUN npm install -g configurable-http-proxy

COPY requirements.txt .
COPY jupyterhub_config.py .

#INSTALL JUPYTERHUB
RUN pip install --upgrade setuptools pip
RUN pip install -r requirements.txt

EXPOSE 8000

ENV LANG=en_US.UTF-8

CMD jupyterhub --debug -f /jupyterhub/jupyterhub_config.py
