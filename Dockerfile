FROM python:3.10.8

ENV PIP_DISABLE_PIP_VERSION_CHECK=on

RUN pip install poetry

COPY . .

COPY poetry.lock pyproject.toml ./

RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction

EXPOSE 8000

CMD ["uvicorn", "plex_trakt.server:app", "--port", "8000"]