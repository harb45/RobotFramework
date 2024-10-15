*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resources/variables.robot

*** Keywords ***
Click Radio
    [Arguments]    ${choice}
    Wait Until Element Is Visible    //span[text()="${choice}"]
    Click Element    //span[text()="${choice}"]
    Sleep    1s

Count Substring In Text
    [Arguments]    ${text}    ${substring}
    ${lower_text}    Convert To Lowercase    ${text}
    ${lower_substring}    Convert To Lowercase    ${substring}
    ${count}    Get Count    ${lower_text}    ${lower_substring}
    RETURN    ${count}

Progress Bar Should Be Complete
    ${progress}    Get Element Attribute    //div[@class='progress-bar bg-success']    aria-valuenow
    RETURN    ${progress}  

Click and Wait
    [Arguments]    ${locator}
    Click Element    ${locator}
    Wait Until Element Is Not Visible    ${locator}

Select Options
    [Arguments]    ${optionTitle}    ${valueLocator}
    Click Element    //div[text()="${optionTitle}"]
    Wait Until Element Is Visible    ${valueLocator}
    Click Element    ${valueLocator}

Click and Verify
    [Arguments]    ${title}
    Click Element    //span[text()='${title}']
    Element Text Should Be    //h1    ${title}

Click Menu
    [Arguments]    ${menuLocator}
    Scroll Element Center
    Click Element    //div[contains(text(),"${menuLocator}")]

Scroll Element Center
    # Execute JavaScript     window.scrollTo(1,500);
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight / 2)