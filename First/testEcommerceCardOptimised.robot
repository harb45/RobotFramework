*** Settings ***

Library           SeleniumLibrary
Resource          ../Resources/keywords.robot

*** Test Cases ***

Test mainPage
    Open URL    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Click Button    //button[text()='Add to Cart']
    Wait Until Element Is Visible    //div[@class='alert alert-success alert-dismissible']
    # Récupérer la couleur du fond et vérifier que c'est le bon résultat
    Verify Background Color    class=alert-success    rgba(223, 240, 216, 1)
    Page Should Contain     1 item(s) - $242.00
    Click Element    //span[@id='cart-total']
    Wait Until Element Is Visible    //td[@class='text-left']/a
    Click Element    //button[@title='Remove']
    Click Element    //img[@title='naveenopencart']
    Close Browser
    
*** Variables ***

${URL}    https://naveenautomationlabs.com/opencart/index.php?route=product/product&path=25_28&product_id=33
${BROWSER}    Chrome
${product}    Samsung SyncMaster 941BW
${search}    //input[@name='search']

