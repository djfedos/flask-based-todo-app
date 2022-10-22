FROM python:3.9

WORKDIR /usr/src/app

COPY flask_app flask_app
RUN ["/bin/bash", "-c", "python -m venv venv"]
RUN ["/bin/bash", "-c", "source venv/bin/activate && pip install flask==2.1.3 flask_sqlalchemy==2.5.1 flask_login==0.6.2 flask_wtf==1.0.1"]

CMD ["/bin/bash", "-c", "source venv/bin/activate && python flask_app/run.py"]