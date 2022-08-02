from flask import Flask

from flask_login import LoginManager

from my_app.api.models import User

from my_app.api.views import tasks

SECRET_KEY = "some secret key"
app = Flask(__name__)
app.config['SECRET_KEY'] = SECRET_KEY
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///mydb.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


login_manager = LoginManager()
login_manager.init_app(app)


@app.route('/index')
def home():
    return "Hello there, Are you excited?"


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

app.register_blueprint(tasks)

tasks.route()

from my_app.api.models import db
db.create_all()
