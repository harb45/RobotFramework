*** Settings ***

Library           SeleniumLibrary
Resource          ../Resources/keywords.robot

*** Variables ***

${URL}    https://naveenautomationlabs.com/opencart/index.php?route=product/product&path=25_28&product_id=33
${URL2}    https://naveenautomationlabs.com/opencart/index.php?route=product/product&path=20_27&product_id=41
${BROWSER}    Chrome

*** Test Cases ***

Test mainPage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    //button[text()='Add to Cart']
    Sleep    2s
    Wait Until Element Is Visible    //div[@class='alert alert-success alert-dismissible']
    Verify Background Color    class=alert-success    rgba(223, 240, 216, 1)
    Element Should Contain    //span[@id='cart-total']     1 item(s)
    Click Element    //span[@id='cart-total']
    Element Should Contain    (//td[@class='text-left']/a)[1]    Samsung SyncMaster 941BW
    Go To    ${URL2}
    Click Button    //button[text()='Add to Cart']
    Wait Until Element Is Visible    //div[@class='alert alert-success alert-dismissible']
    Verify Background Color    class=alert-success    rgba(223, 240, 216, 1)
    Element Should Contain    //span[@id='cart-total']     2 item(s)
    Click Element    //span[@id='cart-total']
    Element Should Contain    (//td[@class='text-left']/a)[1]    Samsung SyncMaster 941BW
    Element Should Contain    (//td[@class='text-left']/a)[2]    iMac
    Sleep    1s
    Close Browser
    
