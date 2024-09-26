*** Settings ***

Library           ${SeleniumLibrary}
Resource          ../Resources/keywords.robot

*** Variables ***

${URL}    https://naveenautomationlabs.com/opencart/index.php?route=common/home
${seleniumLibrary}    SeleniumLibrary
${BROWSER}    Chrome


*** Test Cases ***

Test Search
    Open URL    ${URL}    ${BROWSER}
    VerifyHomePage    //div[@id='slideshow0']
    Element Should Be Visible    //input[@name='search']
    Input Text    //input[@name='search']    MacBook
    Textfield Value Should Be    //input[@name='search']    MacBook
    Click Element    //*[@id="search"]/span/button
    Sleep    2s
    Location Should Contain    MacBook
    Element Should Contain    //*[@id="content"]/div[3]/div[1]/div/div[2]/div[1]    MacBook
    Element Should Contain    //*[@id="content"]/div[4]/div[2]    Showing
    # Click Link    //*[@id="content"]/div[3]/div[1]/div/div[2]/div[1]/h4/a
    Sleep    2s
    Close Browser
    

