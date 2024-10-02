*** Settings ***

Library           SeleniumLibrary
Resource          ../Resources/keywords.robot
Resource          ../Resources/variables.robot

*** Variables ***

&{Desktop}    cat=Desktops    sousCat=Mac
&{Lap}    cat=Laptops & Notebooks    sousCat=Windows
&{Comp}    cat=Components    sousCat=Scanners
@{Category}    &{Desktop}    &{Lap}    &{Comp}

*** Test Cases ***

Test Verfy the header bar

    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    FOR  ${index}    ${chaqueCategory}    IN ENUMERATE    @{Category}
    Element Text Should Be      (//ul[@class='nav navbar-nav']/li)[${index+1}]    ${chaqueCategory.cat}
    Mouse Over    (//ul[@class='nav navbar-nav']/li/a)[${index+1}]
    Wait Until Element Is Visible    (//ul[@class='nav navbar-nav']//ul[@class='list-unstyled'])[${index+1}]
    Element Should Contain    (//ul[@class='nav navbar-nav']//ul[@class='list-unstyled'])[${index+1}]    ${chaqueCategory.sousCat}
    END
    
