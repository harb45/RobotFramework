*** Settings ***

Library           SeleniumLibrary
Resource    ../Resources/Variables.robot

*** Test Cases ***

Test SelectList
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Element Should Be Visible    //div[@id='slideshow0']
    Element Should Be Visible    //div[@class='product-thumb transition']
    Click Element    //a[text()='${product}"']
    Title Should Be    ${product}
    Element Should Be Visible   ${list}
    Scroll Element Into View    ${list}
    Select From List By Value    ${list}    2
    ${valeur}=    Get Selected List Label    ${list}
    Should Contain    ${valeur}    Yellow   
    sleep    2s

*** Variables ***
${product}    Apple Cinema 30
${list}    \id=input-option217
# ...    //select[@id='input-option217']
  