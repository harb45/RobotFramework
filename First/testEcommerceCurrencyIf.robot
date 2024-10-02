*** Settings ***

Library           ${SeleniumLibrary}
Resource          ../Resources/keywords.robot
Resource          ../Resources/Variables.robot

*** Variables ***

${URL}    https://naveenautomationlabs.com/opencart/index.php?route=common/home
${seleniumLibrary}    SeleniumLibrary
${BROWSER}    Chrome
${devise}
${symbole}
&{eur}    codeDevise=EUR    symboleDevise=€
&{gbp}    codeDevise=GBP    symboleDevise=£
&{usd}    codeDevise=USD    symboleDevise=$
@{devises}    &{eur}    &{gbp}    &{usd}

*** Keywords ***

Select currency
    [Arguments]    ${codeDevise}    ${symboleDevise}
    # 
    # Wait Until Element Is Visible    //div[@class='btn-group open']/ul
    # Sleep    1s
    
    # Click Button    //button[@name='${codeDevise}']
    # Wait Until Element Contains    //p[@class='price']    ${symboleDevise}
    # Sleep    1s
    IF  '${codeDevise} == EUR'
        Mouse Over    //button[@name='${codeDevise}']
        Click Button    //button[@name='${codeDevise}']
        Wait Until Element Contains    //p[@class='price']    ${symboleDevise}
    ELSE IF    '${codeDevise} == USD'
        Mouse Over    //button[@name='${codeDevise}']
        Click Button    //button[@name='${codeDevise}']
        Wait Until Element Contains    //p[@class='price']    ${symboleDevise}
    ELSE IF    '${codeDevise} == GBP'
        Mouse Over    //button[@name='${codeDevise}']
        Click Button    //button[@name='${codeDevise}']
        Wait Until Element Contains    //p[@class='price']    ${symboleDevise}
    ELSE
        Log    ${codeDevise} not found  
    END

*** Test Cases ***

Test Changing currency
    Open URL    ${URL}    ${BROWSER}
    VerifyHomePage    //div[@id='slideshow0']
    FOR  ${chaqueDevise}  IN  @{devises}
        Click Button    //button[contains(.,'Currency')]
        Select currency   &{chaqueDevise}
    END
    
     
    


