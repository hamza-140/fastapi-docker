FROM python:3.10-slim

WORKDIR /app


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./app /app


EXPOSE 9000


CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9000"]
