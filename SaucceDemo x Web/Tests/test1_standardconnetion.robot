*** Settings ***

Library        SeleniumLibrary
Resource        ../Resources/keywords.robot
Resource        ../Resources/variables.robot

*** Test Cases ***
Scenario : Connect and log out the standard user
    Given I am in the main page
    When The Standard user tape his ids
    Then I should be redirected to all items
    And I disconnect the user
    And I am redirected to the main page