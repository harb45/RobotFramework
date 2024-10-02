*** Settings ***

Library           SeleniumLibrary
Resource          ../Resources/keywords.robot

*** Variables ***

${urlSamsung}    https://naveenautomationlabs.com/opencart/index.php?route=product/product&path=25_28&product_id=33
${urliMac}    https://naveenautomationlabs.com/opencart/index.php?route=product/product&path=20_27&product_id=41
${BROWSER}    Chrome
@{listeUrlProduits}    ${urlSamsung}    ${urliMac}

*** Test Cases ***

Test Ajouter au panier Boucle
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

    FOR    ${chaqueUrl}    IN    @{listeUrlProduits}
        Go To   ${chaqueUrl}
        Click Button    //button[text()='Add to Cart']
        Wait Until Element Is Visible    class=alert-success
    END
    ${nbrItem}    Get Length    ${listeUrlProduits}
    Wait Until Element Contains    id=cart-total    ${nbrItem} item(s)
