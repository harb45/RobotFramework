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
    
Verify Button and Click
    [Arguments]    ${balise}    ${Attribut}    ${Valeur}
    Element Should Be Visible    ${balise}\[${Attribut}=${Valeur}]
    Click Element    ${balise}\[${Attribut}=${Valeur}]

Verify Background Color
    [Arguments]    ${elem}    ${rgbacolor}
    ${elem}    Get Webelement    class=alert-success
    ${bg color}    Call Method    ${elem}    value_of_css_property    background-color
    Should Be Equal    ${bg color}    rgba(223, 240, 216, 1)