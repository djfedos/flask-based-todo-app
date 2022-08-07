FROM python:3.9

WORKDIR /usr/src/app

COPY flask_app flask_app
RUN pip install --upgrade pip
RUN pip install flask flask_sqlachemy flask_login

CMD python flask_app/run.py