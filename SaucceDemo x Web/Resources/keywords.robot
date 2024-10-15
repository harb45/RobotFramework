*** Settings ***

Library        SeleniumLibrary
Library        FakerLibrary
Resource        ../Resources/variables.robot
Resource        ../Resources/library.resource

*** Keywords ***

I am in the main page
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

The Standard user tape his ids
    Input Text    ${userInput}    ${standardUser}
    Input Password    ${passwordInput}    ${password}
    Click Element    //input[@id='login-button']

I should be redirected to all items
    Element Text Should Be    //div[@class='app_logo']    Swag Labs
    Element Text Should Be    ${pageTitle}    Products
    Element Should Be Visible    //a[@class='shopping_cart_link']

I disconnect the user
    Click Button    //button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible    //a[@id='logout_sidebar_link']
    Click Element    //a[@id='logout_sidebar_link']

I am redirected to the main page
    Element Should Be Visible    ${userInput}
    Element Should Be Visible    ${passwordInput}

# SecondTest
The Locked user tape his ids
    Input Text    ${userInput}    ${locked}
    Input Password    ${passwordInput}    ${password}
    Click Element    //input[@id='login-button']

An error message should popup
    Element Should Be Visible    //div[@class="error-message-container error"]
    Element Text Should Be    //h3    Epic sadface: Sorry, this user has been locked out.
    Element Should Be Visible    //button[@class="error-button"]

# Final Test
I sorted the list
    Element Should Be Visible    ${listTri}
    Select From List By Value    ${listTri}    hilo

I add two articles to the card
    Add articles    ${logoCard}    ${add}    ${remove}    ${totalNumber}

I check my card
    Click Element    //a[@class="shopping_cart_link"]
    Element Should Be Visible    //a[@class="shopping_cart_link"]
    Element Text Should Be    ${pageTitle}    Your Cart
    ${number}    Get Element Count    //div[@class="cart_item"]
    ${TotalNumber}    Evaluate    2
    Should Be Equal     ${number}    ${TotalNumber}

I clicked on checkout
    Element Should Be Visible    //button[@id="checkout"]
    Click Button    //button[@id="checkout"]
I tape my informations
    ${lastName} =    FakerLibrary.last_name
    ${firstName} =     FakerLibrary.first_name
    ${PostalCode} =     FakerLibrary.postcode
    Element Text Should Be    ${pageTitle}    Checkout: Your Information
    Input Text    //input[@id='first-name']    ${firstName}
    Input Text    //input[@id='last-name']    ${lastName}
    Input Text    //input[@id='postal-code']    ${PostalCode}
    Click Element    //input[@id='continue']

I should see my command details
    Element Text Should Be    ${pageTitle}    Checkout: Overview
    @{price} =    Get WebElements    //div[@class="inventory_item_price"]
    ${priceHT}    Evaluate    0
    FOR  ${eachPrice}  IN  @{price}
        ${cleanPrice}    Clean Price    ${eachPrice}    $
        ${priceHT}    Evaluate    ${priceHT} + ${cleanPrice}
    END
    ${finalPrice}    Clean Price    ${subLocator}    Item total: $
    Should Be Equal    ${finalPrice}    ${priceHT}
    ${tax}    Clean Price    ${taxLocator}    Tax: $
    ${totalPrice}    Evaluate    round(${priceHT} + ${tax},2)
    ${Total}    Clean Price    ${totalLocator}    Total: $
    Should Be Equal    ${Total}    ${totalPrice}

I confirm my command
    Click Button    //button[@id="finish"]
    Element Should Be Visible    ${pageTitle}
    Element Text Should Be    ${pageTitle}    Checkout: Complete!
    Element Should Be Visible    //h2
    Element Text Should Be    //h2    Thank you for your order!
    Element Should Be Visible    //button[@id="back-to-products"]