*** Settings ***
Library    AppiumLibrary
Resource    ../Mobile/CustomKeywords.resource

*** Variables ***

# Application
${REMOTE_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${DEVICE_NAME}      sdk_gphone64_x86_64
${PLATFORM_VERSION}    13
${APP_PATH}         C:/Users/Administrateur/Desktop/Appium/Resources/calculator.apk
${AUTOMATION_NAME}  UiAutomator2

*** Keywords ***
The calculator is running
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    automationName=${AUTOMATION_NAME}    deviceName=${DEVICE_NAME}    app=${APP_PATH}    platformVersion=${PLATFORM_VERSION}

The User Enters The Term "${var1} ${operator} ${var2}"
    Click number    ${var1}
    ${op_locator}    Verify Operator    ${operator}    
    Click Element    ${op_locator}
    Click number    ${var2}

The Result Should Be "${resultat}"
    ${resultat_attendu}    Get Text    //android.widget.TextView[@resource-id="com.google.android.calculator:id/result"]
    Should Be Equal   ${resultat}    ${resultat_attendu}