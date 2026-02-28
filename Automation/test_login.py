import pytest
from playwright.sync_api import Page

def test_successful_login(page: Page):
    page.goto("https://the-internet.herokuapp.com/login")
    page.fill("#username", "tomsmith")
    page.fill("#password", "SuperSecretPassword!")
    page.click("button[type='submit']")
    assert page.locator(".flash.success").is_visible()

def test_incorrect_password(page: Page):
    page.goto("https://the-internet.herokuapp.com/login")
    page.fill("#username", "tomsmith")
    page.fill("#password", "InvalidPassword")
    page.click("button[type='submit']")
    assert page.locator(".flash.error").is_visible()
