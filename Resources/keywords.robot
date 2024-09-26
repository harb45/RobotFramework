*** Settings ***

Library           ${SeleniumLibrary}

*** Variables ***

${SeleniumLibrary}    SeleniumLibrary

*** Keywords ***

Click Menu
    [Arguments]    ${menu}    ${titrePAge}
    Click Element    //a[text()='${menu}']
    Title Should Be    ${titrePAge}

VerifyHomePage
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}
    Title Should Be    Your Store

Open URL
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    2s
    