# Automation Testing — Playwright + pytest

## Tools
- Python 3.14
- Playwright
- pytest

## How to run

Install dependencies:
pip install playwright pytest pytest-playwright
playwright install chromium

Run tests:
pytest test_login.py -v --headed

## Test Cases
- test_успешный_вход — successful login with valid credentials
- test_неверный_пароль — login with invalid password shows error
