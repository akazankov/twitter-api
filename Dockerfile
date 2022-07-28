FROM python:3.8-alpine as base

WORKDIR /code
COPY . /code

RUN REQUESTS_CA_BUNDLE=/code/sick-my-duck.pem pip install --trusted-host='pypi.python.org pypi.org files.pythonhosted.org' --upgrade pip
RUN REQUESTS_CA_BUNDLE=/code/sick-my-duck.pem pip install --trusted-host='pypi.python.org pypi.org files.pythonhosted.org' -r dev-requirements.txt

ENV DATABASE_URL postgresql://localhost/twitter_api_flask
ENV FLASK_APP wsgi.py
ENV FLASK_ENV development

EXPOSE 5000

# CMD ["flask", "run", "--host", "0.0.0.0"]
ENV FLASK_APP wsgi.py
