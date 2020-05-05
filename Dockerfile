FROM ubuntu:20.04

RUN apt-get update -y && \
    apt-get install -y python3-pip python-dev libpq-dev

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

ENV DATABASE_URL 'postgres://postgres:ChangeM3!@localhost:5432/flask_message_board'

ENTRYPOINT ["python3"]

CMD ["app.py"]

# CMD ["flask", "run"]