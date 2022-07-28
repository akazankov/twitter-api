FROM python:3.8-alpine as base

RUN pip install --upgrade pip

WORKDIR /code
COPY . /code

RUN pip install -r dev-requirements.txt

ENV DATABASE_URL postgresql://localhost/twitter_api_flask
ENV FLASK_APP wsgi.py
ENV FLASK_ENV development

EXPOSE 5000

CMD ["flask", "run", "--host", "0.0.0.0"]

