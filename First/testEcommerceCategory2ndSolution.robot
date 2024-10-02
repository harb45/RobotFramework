*** Settings ***

Library           SeleniumLibrary
Resource          ../Resources/keywords.robot
Resource          ../Resources/variables.robot

*** Variables ***

${urlDesktop}    https://naveenautomationlabs.com/opencart/index.php?route=product/category&path=20
${urlLaptop}    https://naveenautomationlabs.com/opencart/index.php?route=product/category&path=18
${urlComponent}    https://naveenautomationlabs.com/opencart/index.php?route=product/category&path=25

&{Desktop}    url=${urlDesktop}    cat=Desktops    sousCat=Mac
&{Lap}    url=${urlLaptop}    cat=Laptops & Notebooks    sousCat=Windows
&{Comp}    url=${urlComponent}    cat=Components    sousCat=Scanners
@{Category}    &{Desktop}    &{Lap}    &{Comp}

*** Test Cases ***

Test Verfy the header bar

    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    FOR  ${index}    ${chaqueCategory}    IN ENUMERATE    @{Category}
    Go To    url=${chaqueCategory.url}
    Element Text Should Be      (//ul[@class='nav navbar-nav']/li)[${index+1}]    ${chaqueCategory.cat}
    Mouse Over    (//ul[@class='nav navbar-nav']/li/a)[${index+1}]
    Wait Until Element Is Visible    (//ul[@class='nav navbar-nav']//ul[@class='list-unstyled'])[${index+1}]
    Element Should Contain    (//ul[@class='nav navbar-nav']//ul[@class='list-unstyled'])[${index+1}]    ${chaqueCategory.sousCat}
    Wait Until Element Is Visible    //div[@class='list-group']/a[contains(text(),'${chaqueCategory.cat}')]
    Wait Until Element Is Visible    //div[@class='list-group']/a[contains(text(),'${chaqueCategory.sousCat}')]
    Element Text Should Be    //h2    ${chaqueCategory.cat}
    END
    

