import requests
from my_app import app


def test_home_page():
    app.run()
    response = requests.get('0.0.0.0:5000/login')
    assert response.status_code == 200
    assert b"Stay Organized!" in response.data


