from flask import Blueprint

tasks = Blueprint('tasks', __name__)


@tasks.route('/home')
def home():
    return "Welcome Home."