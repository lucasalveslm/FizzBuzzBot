FROM python:3.8.0-buster

RUN pip install pipenv
COPY Pipfile /tmp
RUN cd /tmp && pipenv lock --requirements > requirements.txt
RUN pip install -r /tmp/requirements.txt
COPY . /tmp/app
RUN cd /tmp/app
RUN python manage.py db migrate
RUN python manage.py db upgrade

CMD python app.py