FROM python:3.9

WORKDIR /usr/src/app

COPY flask_app flask_app
RUN ["/bin/bash", "-c", "python -m venv venv"]
RUN ["/bin/bash", "-c", "source venv/bin/activate"]
RUN ["/bin/bash", "-c", "pip install --upgrade pip"]
RUN ["/bin/bash", "-c", "pip install flask"]
RUN ["/bin/bash", "-c", "pip install flask_sqlalchemy"]
RUN ["/bin/bash", "-c", "pip install flask_login"]

CMD python flask_app/run.py