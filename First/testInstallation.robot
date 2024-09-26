*** Settings ***
 
Library           SeleniumLibrary
 
*** Test Cases ***
 
Test Installation
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Element Should Be Visible    //div[@id='slideshow0']
    Close Browser
   
*** Variables ***
 
${URL}    https://naveenautomationlabs.com/opencart/index.php?route=common/home
${BROWSER}    Chrome
 