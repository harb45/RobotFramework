*** Settings ***

Library        SeleniumLibrary
Resource        ../Resources/keywords.robot
Resource        ../Resources/variables.robot

*** Test Cases ***
Scenario : Try the locked out user
    Given I am in the main page
    When The Locked user tape his ids
    Then An error message should popup