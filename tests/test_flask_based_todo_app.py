import requests


def test_home_page():
    response = requests.get('http://127.0.0.1:5000/login')
    assert response.status_code == 200
    assert "Stay Organized!" in response.text
