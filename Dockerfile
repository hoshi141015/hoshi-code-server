FROM python:3.8.3-slim AS python
WORKDIR /app

RUN pip install poetry
COPY pyproject.toml ./
RUN poetry install

FROM python AS code-server

RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server \
  --install-extension ms-python.python \
  --install-extension ms-ceintl.vscode-language-pack-ja
