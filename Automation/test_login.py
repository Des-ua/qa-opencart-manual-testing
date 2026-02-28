import pytest
from playwright.sync_api import Page

def test_успешный_вход(page: Page):
    page.goto("https://the-internet.herokuapp.com/login")
    page.fill("#username", "tomsmith")
    page.fill("#password", "SuperSecretPassword!")
    page.click("button[type='submit']")
    assert page.locator(".flash.success").is_visible()

def test_неверный_пароль(page: Page):
    page.goto("https://the-internet.herokuapp.com/login")
    page.fill("#username", "tomsmith")
    page.fill("#password", "НеверныйПароль")
    page.click("button[type='submit']")
    assert page.locator(".flash.error").is_visible()
