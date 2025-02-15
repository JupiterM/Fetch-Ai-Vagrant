FROM python:3.12-slim
ENV PATH="$PATH:/root/.local/bin"
WORKDIR /src
COPY /opt/uAgents/python/ /src/ 
RUN apt-get update
RUN pip install poetry && \
    poetry install --only main --no-root --no-directory
COPY /opt/uAgents/python/examples/01-first-agent/main.py /src/
RUN poetry install --only main
EXPOSE 8000
ENTRYPOINT ["poetry", "run"]
CMD ["python", "main.py"]
