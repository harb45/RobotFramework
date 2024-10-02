*** Settings ***

Library           SeleniumLibrary
Resource    ../Resources/Variables.robot

*** Test Cases ***

Test SelectList
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Element Should Be Visible    //div[@id='slideshow0']
    Click Element    //a[text()='Components']
    Click Element    //a[contains(text(),'Monitors')]
    List Selection Should Be    id:input-sort    Default
    Element Should Be Visible    (//h4/a)[1][text()='Apple Cinema 30"']
    Element Should Be Visible    (//h4/a)[2][text()='Samsung SyncMaster 941BW']
    Select From List By Label    //select[@id='input-sort']    Name (Z - A)
    Element Should Be Visible    (//h4/a)[2][text()='Apple Cinema 30"']
    Element Should Be Visible    (//h4/a)[1][text()='Samsung SyncMaster 941BW']
    Sleep    2s
    Close Browser
