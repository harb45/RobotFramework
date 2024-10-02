*** Settings ***

Library           SeleniumLibrary
Resource        ../Resources/keywords.robot

*** Variables ***

${URL}    https://naveenautomationlabs.com/opencart/index.php?route=common/home
${BROWSER}    Chrome
${username}    qamha.automatisation@gmail.com
${password}    Aa123456!

*** Keywords ***

Login
    [Arguments]    ${login}    ${pswrd}
    Click Menu    Login    Account Login
    Input Text    //input[@id='input-email']    ${login}
    Input Password    //input[@id='input-password']    ${pswrd}  
    Verify Button and Click    //input    @value    'Login'
    Title Should Be    My Account  

Deconnect
    Click Element    //i[@class='fa fa-home']
    Element Should Be Visible    //a[@class='dropdown-toggle']
    Click Element    //a[@class='dropdown-toggle']
    Element Should Be Visible    //a[text()='Logout']
    Click Element    //a[text()='Logout']

*** Test Cases ***

Test Connect
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Element Should Be Visible    //div[@id='slideshow0']
    Element Should Be Visible    //a[@class='dropdown-toggle']
    Verify Button and Click    //span    @class    'caret'
    ${conection}    Run Keyword And Return Status    Mouse Over    //a[text()='Login']
    IF  ${conection}
    Login    ${username}    ${password} 
    ELSE
    Deconnect
    END
    
    Verify Button and Click    //span    @class    'caret'
    ${conection}    Run Keyword And Return Status    Mouse Over    //a[text()='Login']
    IF  ${conection}
    Login    ${username}    ${password} 
    ELSE
    Deconnect
    END

    # Run Keyword And Return Status    Login    ${username}    ${password}
    

    # Déconnexion
    

