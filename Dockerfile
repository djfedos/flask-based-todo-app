FROM python:3.9

WORKDIR /usr/src/app

COPY flask_app flask_app
RUN ["/bin/bash", "-c", "python -m venv venv"]
RUN ["pip install --upgrade pip"]
RUN ["/bin/bash", "-c", "source venv/bin/activate && pip install flask flask_sqlalchemy flask_login flask_wtf"]


CMD ["/bin/bash", "-c", "source venv/bin/activate && python flask_app/run.py"]