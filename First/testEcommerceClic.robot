*** Settings ***

Library           ${SeleniumLibrary}
Resource          ../Resources/keywords.robot

*** Test Cases ***

Test mainPage
    Open URL    ${URL}    ${BROWSER}
    # Open Browser    ${URL}    ${BROWSER}
    # Maximize Browser Window
    # Sleep    2s
    VerifyHomePage    //div[@id='slideshow0']
    # Element Should Be Visible    //div[@id='slideshow0']
    # Title Should Be    Your Store
    Click Menu    Software    Software
    # Click Element    //nav[@id="menu"]/div[2]/ul/li[5]/a
    # Title Should Be    Software
    Element Should Contain    //div[@id="content"]/p   There are no products to list in this category.
    Sleep    2s
    Click Element    //a[@class='btn btn-primary']
    Sleep    2s
    VerifyHomePage    //div[@class='swiper-wrapper']
    # Element Should Be Visible    //div[@class='swiper-wrapper']
    # Close Browser
    
*** Variables ***

${URL}    https://naveenautomationlabs.com/opencart/index.php?route=common/home
${seleniumLibrary}    SeleniumLibrary
${BROWSER}    Chrome

*** Keywords ***

Open URL
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    2s
