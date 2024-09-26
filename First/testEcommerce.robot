*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***

Test Installation
    Open Browser    https://google.com    chrome
    Maximize Browser Window
    Sleep    5s