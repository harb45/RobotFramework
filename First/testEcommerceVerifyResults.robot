*** Settings ***

Library           SeleniumLibrary
Resource          ../Resources/keywords.robot

*** Variables ***

${url}    https://naveenautomationlabs.com/opencart/index.php?route=product/category&path=25
${BROWSER}    Chrome


*** Test Cases ***

Test vérifier résultat
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Element Should Be Visible    //h2
    Element Text Should Be    //h2    Components
    ${elementLen}    Get Element Count    //div[@class='col-sm-3']/ul 
    FOR    ${index}    IN RANGE    0   ${elementLen-1}
        ${element}   Get Text    //div[@class='col-sm-3']/ul/li
        Element Text Should Be    //div[@class='col-sm-3']/ul/li    ${element}
        Log    Le résultat ${index} est ${element} et est trouvé avec succès
    END