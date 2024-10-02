*** Settings ***

Library           SeleniumLibrary
Resource        ../Resources/keywords.robot

*** Test Cases ***

Test Connect
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    &{logins}    Create Dictionary    login=${username}    pswrd=${password}
    Sleep    2s
    Element Should Be Visible    //div[@id='slideshow0']
    Element Should Be Visible    //a[@class='dropdown-toggle']
    Click Element    //span[@class='caret']
    Sleep    2s
    Click Menu    Login    Account Login
    Sleep    2s
    Input Text    //input[@id='input-email']    ${logins.login}
    Input Password    //input[@id='input-password']    ${logins.pswrd}    
    Sleep    2s
    Verify Button and Click    //input    @value    'Login'
    Title Should Be    My Account

    # Déconnexion
    

    # Element Should Be Visible    //a[@class='dropdown-toggle']
    # Click Element    //a[@class='dropdown-toggle']
    # Element Should Be Visible    //a[text()='Logout']
    # Click Element    //a[text()='Logout']
    Sleep    2s
    Close Browser
    
*** Variables ***

${URL}    https://naveenautomationlabs.com/opencart/index.php?route=common/home
${BROWSER}    Chrome
${username}    qamha.automatisation@gmail.com
${password}    Aa123456!