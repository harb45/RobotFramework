*** Settings ***

Library           ${SeleniumLibrary}
Resource          ../Resources/keywords.robot
Resource          ../Resources/Variables.robot

*** Variables ***

${URL}    https://naveenautomationlabs.com/opencart/index.php?route=common/home
${seleniumLibrary}    SeleniumLibrary
${BROWSER}    Chrome

*** Keywords ***

Select currency
    [Arguments]    ${Devise}    ${symbole}
    Click Button    //button[contains(.,'Currency')]
    Wait Until Element Is Visible    //div[@class='btn-group open']/ul
    Sleep    1s
    Mouse Over    //button[@name='${Devise}']
    Click Button    //button[@name='${Devise}']
    Wait Until Element Contains    //p[@class='price']    ${symbole}
    Sleep    1s

*** Test Cases ***

Test Changing currency
    Open URL    ${URL}    ${BROWSER}
    VerifyHomePage    //div[@id='slideshow0']
    Select currency    EUR    €
    Select currency    GBP    £
    Select currency    USD    $

