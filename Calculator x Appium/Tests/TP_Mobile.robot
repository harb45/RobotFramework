*** Settings ***
Library    AppiumLibrary
Resource    ../Mobile/keywords.resource
*** Test Cases ***

Scenario : Calcul Addition
    Given The calculator is running
    When The User Enters The Term "5 + 3"
    Then The Result Should Be "8"

Scenario : Calcul Multiplication
    Given The calculator is running
    When The User Enters The Term "6 × 8"
    Then The Result Should Be "48"

Scenario : Calcul Division
    Given The calculator is running
    When The User Enters The Term "9 / 3"
    Then The Result Should Be "3"

Scenario : Calcul Soustraction
    Given The calculator is running
    When The User Enters The Term "2 − 7"
    Then The Result Should Be "−5"

Scenario : Calcul X
    Given The calculator is running
    When The User Enters The Term "23 + 48"
    Then The Result Should Be "71"