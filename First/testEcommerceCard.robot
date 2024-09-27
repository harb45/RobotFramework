*** Settings ***

Library           SeleniumLibrary
Resource          ../Resources/keywords.robot

*** Test Cases ***

Test mainPage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Element Should Be Visible    //div[@id='slideshow0']
    Input Text    ${search}    ${product}
    Press Keys    ${search}    RETURN
    Element Text Should Be    //h4/a    ${product}
    Click Link    ${product}
    Click Button    //button[text()='Add to Cart']
    Sleep    2s
    Element Should Be Visible    //div[@class='alert alert-success alert-dismissible']
    # Récupérer la couleur du fond et vérifier que c'est le bon résultat
    Verify Background Color    class=alert-success    rgba(223, 240, 216, 1)
    Page Should Contain     1 item(s) - $242.00
    Click Element    //span[@id='cart-total']
    Sleep    1s 
    Element Should Be Visible    //td[@class='text-left']/a
    Sleep    1s
    Click Element    //button[@title='Remove']
    Sleep    1s
    Click Element    //img[@title='naveenopencart']
    Sleep    2s
    Close Browser
    
*** Variables ***

${URL}    https://naveenautomationlabs.com/opencart/index.php?route=common/home
${BROWSER}    Chrome
${product}    Samsung SyncMaster 941BW
${search}    //input[@name='search']
