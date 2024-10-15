*** Settings ***

Library        SeleniumLibrary
Library        FakerLibrary
Library        String
Resource        ../Resources/variables.robot

*** Keywords ***

I am in the main page
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

The User tape his ids
    [Arguments]    ${user}    ${password}
    Input Text    //input[@id='user-name']    ${user}
    Input Password    //input[@id='password']    ${password}
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
    Element Should Be Visible    //input[@id='user-name']
    Element Should Be Visible    //input[@id='password']

# SecondTest
An error message should popup
    Element Should Be Visible    //div[@class="error-message-container error"]
    Element Text Should Be    //h3    Epic sadface: Sorry, this user has been locked out.
    Element Should Be Visible    //button[@class="error-button"]

# Final Test
I sorted the list
    Element Should Be Visible    //select[@class="product_sort_container"]
    Select From List By Value    //select[@class="product_sort_container"]    hilo

I add two articles to the card
    Click Button    //button[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Wait Until Element Is Visible    //span[@class="shopping_cart_badge"]
    Element Text Should Be    //span[@class="shopping_cart_badge"]    1
    Wait Until Element Is Visible    //button[@id="remove-sauce-labs-fleece-jacket"]
    Click Button    //button[@id="add-to-cart-sauce-labs-backpack"]
    Element Text Should Be    //span[@class="shopping_cart_badge"]    2
    Wait Until Element Is Visible    //button[@id="remove-sauce-labs-backpack"]

I check my card
    Click Element    //a[@class="shopping_cart_link"]
    Element Should Be Visible    //a[@class="shopping_cart_link"]
    Element Text Should Be    ${pageTitle}    Your Cart
    ${nombre}    Get Element Count    //div[@class="cart_item"]
    ${nombreTotal}    Evaluate    2
    Should Be Equal     ${nombre}    ${nombreTotal}

I clicked on checkout
    Element Should Be Visible    //button[@id="checkout"]
    Click Button    //button[@id="checkout"]
I tape my informations
    ${nom} =    FakerLibrary.last_name
    ${prenom} =     FakerLibrary.first_name
    ${codePostal} =     FakerLibrary.postcode
    Element Text Should Be    ${pageTitle}    Checkout: Your Information
    Input Text    //input[@id='first-name']    ${prenom}
    Input Text    //input[@id='last-name']    ${nom}
    Input Text    //input[@id='postal-code']    ${codePostal}
    Click Element    //input[@id='continue']

I should see my command details
    Element Text Should Be    ${pageTitle}    Checkout: Overview
    @{prix} =    Get WebElements    //div[@class="inventory_item_price"]
    ${prixHT}    Evaluate    0
    FOR  ${chaquePrix}  IN  @{prix}
        ${prixText}    Get Text    ${chaquePrix}
        ${prix_sans_dollar}    Remove String    ${prixText}    $
        ${prix_sans_dollar}    Convert To Number    ${prix_sans_dollar}
        ${prixHT}    Evaluate    ${prixHT} + ${prix_sans_dollar}
    END
    ${tax}    Get Text    //div[@class="summary_tax_label"]
    ${tax}    Remove String    ${tax}    Tax: $
    ${tax}    Convert To Number    ${tax}
    ${prixTotal}    Evaluate    round(${prixHT} + ${tax},2)
    ${Total}    Get Text    //div[@class="summary_total_label"]
    ${Total}    Remove String    ${Total}    Total: $
    ${Total}    Convert To Number    ${Total}
    Should Be Equal    ${Total}    ${prixTotal}

I confirm my command
    Click Button    //button[@id="finish"]
    Element Should Be Visible    ${pageTitle}
    Element Text Should Be    ${pageTitle}    Checkout: Complete!
    Element Should Be Visible    //h2
    Element Text Should Be    //h2    Thank you for your order!
    Element Should Be Visible    //button[@id="back-to-products"]