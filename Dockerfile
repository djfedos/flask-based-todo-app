FROM ubuntu

WORKDIR /usr/src/app

USER root
RUN apt update || true
RUN apt install python3 -y || true
RUN apt install python3-venv -y || true
RUN apt install pip -y || true


RUN bash -c "python3 -m venv venv"
COPY flask_app flask_app
RUN bash -c "source venv/bin/activate || true"
RUN bash -c "pip install flask flask_sqlachemy flask_login"

CMD python flask_app/run.py