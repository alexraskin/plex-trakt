 FROM python:3.10.8

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./plex_trakt /code/plex_trakt

CMD ["uvicorn", "plex_trakt.server:app", "--host", "0.0.0.0", "--port", "80"]
