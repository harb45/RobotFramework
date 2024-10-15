*** Settings ***
Library    SeleniumLibrary
Library    String
*** Keywords ***

Add articles
    [Arguments]    ${boutton}    ${addBoutton}    ${removeBoutton}    ${nombreArticles}
    FOR  ${index}  IN RANGE    ${nombreArticles}
        Click Button    (${addBoutton})[${index+1}]
        Element Should Be Visible    ${boutton}
        Element Text Should Be    ${boutton}    ${index+1}
        Wait Until Element Is Visible    (${removeBoutton})[${index+1}]
    END

Clean Price
    [Arguments]    ${locator}    ${texte_a_supprimer}
    ${variable_string}    Get Text    ${locator}
    ${variable_string}    Remove String    ${variable_string}    ${texte_a_supprimer}
    ${variable_nombre}    Convert To Number    ${variable_string}
    RETURN    ${variable_nombre}
    



