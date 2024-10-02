*** Settings ***

Library           SeleniumLibrary
Resource          ../Resources/keywords.robot
Resource          ../Resources/variables.robot

*** Variables ***

${urlSamsung}    https://naveenautomationlabs.com/opencart/index.php?route=product/product&path=25_28&product_id=33
${urliMac}    https://naveenautomationlabs.com/opencart/index.php?route=product/product&path=20_27&product_id=41
${urliPhone}    https://naveenautomationlabs.com/opencart/index.php?route=product/product&product_id=40
${urlmacBook}    https://naveenautomationlabs.com/opencart/index.php?route=product/product&product_id=43
${BROWSER}    Chrome
&{Samsung}    url=${urlSamsung}    nom=Samsung SyncMaster 941BW    prix=$242.00
&{iMac}    url=${urliMac}    nom=iMac    prix=$122.00
&{iPhone}    url=${urliPhone}    nom=iPhone    prix=$123.20
&{macBook}    url=${urlmacBook}    nom=MacBook    prix=$602.00
@{listeProduits}    &{Samsung}    &{iMac}    &{macBook}    ${iPhone}


*** Test Cases ***

Test Ajouter des articles au panier
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    FOR    ${index}    ${chaqueProduit}    IN ENUMERATE    @{listeProduits}
        Go To    ${chaqueProduit.url}
        Click Button     //button[@id="button-cart"]
        Wait Until Element Is Visible    class=alert-success
        Wait Until Element Contains    id=cart-total    ${index+1} item(s)
        Click Element    id=cart-total    
        Wait Until Element Contains    //table[@class='table table-striped']    ${chaqueProduit.nom}
        Log    Le produit '${chaqueProduit.nom}' est ajouté avec succès !!
        Element Text Should Be    (//tr[contains(., '${chaqueProduit.nom}')]/td[@class='text-right'])[2]    ${chaqueProduit.prix}
        Log    Prix du produit ${chaqueProduit.nom} est ${chaqueProduit.prix} !
    END
    
    
