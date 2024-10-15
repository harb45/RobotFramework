*** Settings ***
Library    AppiumLibrary
Library    Collections

*** Keywords ***
Verify Operator
    [Arguments]    ${operator}
    IF    '${operator}' == '+'
        ${op_locator}=    Set Variable    accessibility_id=plus
    ELSE IF    '${operator}' == '×'
        ${op_locator}=    Set Variable    accessibility_id=×
    ELSE IF    '${operator}' == '/'
        ${op_locator}=    Set Variable    accessibility_id=divide
    ELSE IF    '${operator}' == '−'
        ${op_locator}=    Set Variable    accessibility_id=minus
    END
    RETURN    ${op_locator}

Click number
    [Arguments]    ${var}
    ${numbers}    Convert To List    ${var}
    FOR    ${number}    IN    @{numbers}
        Click Element    //android.widget.Button[@resource-id="com.google.android.calculator:id/digit_${number}"]
    END