FROM python:3.9

WORKDIR /usr/src/app

COPY flask_app flask_app
RUN ["/bin/bash", "-c", "python -m venv venv"]
RUN ["/bin/bash", "-c", "source venv/bin/activate && python -m pip install --upgrade pip && pip install flask flask_sqlalchemy flask_login flask_wtf"]

CMD ["/bin/bash", "-c", "source venv/bin/activate && python flask_app/run.py"]