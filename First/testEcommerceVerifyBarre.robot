*** Settings ***

Library           SeleniumLibrary
Library           Collections
Resource          ../Resources/keywords.robot

*** Variables ***

${url}    https://naveenautomationlabs.com/opencart/index.php?route=common/home
${BROWSER}    Chrome
@{listMenu}


*** Test Cases ***

Test vérifier la barre de navigation
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Your Store
    ${elementLen}    Get Element Count    //ul[@class='nav navbar-nav']/li
    # Log    ${elementLen}
    FOR    ${index}    IN RANGE    1   ${elementLen+1}
        ${element}   Get Text    (//ul[@class='nav navbar-nav']/li)[${index}]
        Append To List    ${listMenu}    ${element}
        # Log    ${listMenu}
    END
    Length Should Be    ${listMenu}    8