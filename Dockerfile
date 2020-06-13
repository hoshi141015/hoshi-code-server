FROM python:3.8.3-slim
WORKDIR /app

RUN pip install poetry
COPY pyproject.toml ./
RUN poetry install
