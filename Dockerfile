FROM python:3.7-buster

# Configuration defaults
ENV APP_ROOT "/opt/core"
ARG USER_ID="1000"
ENV DJANGO_USER_ID "${USER_ID}"
ENV DJANGO_USER "www-data"
ENV VENV_NAME ".venv-docker"

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

WORKDIR "$APP_ROOT"
ADD ./requirements.txt .
RUN pip install virtualenv && \
    virtualenv "/opt/$VENV_NAME"
ENV PATH="/opt/$VENV_NAME/bin:${PATH}"

RUN pip install -r requirements.txt
RUN userdel "$DJANGO_USER" && addgroup --system --gid "$DJANGO_USER_ID" "$DJANGO_USER" && \
    adduser --system --uid "$DJANGO_USER_ID" --ingroup "$DJANGO_USER" --shell /bin/false "$DJANGO_USER"
RUN mkdir "$APP_ROOT/getBici" && chown -R "$DJANGO_USER"."$DJANGO_USER" "$APP_ROOT/getBici"

USER "${DJANGO_USER}"