*** Settings ***

Library        SeleniumLibrary
Library        FakerLibrary
Resource        ../Resources/keywords.robot
Resource        ../Resources/variables.robot

*** Test Cases ***
Connexion
    Given I am in the main page
    When The Standard user tape his ids
    Then I should be redirected to all items
Add To Card
    Given I sorted the list
    When I add two articles to the card
    Then I check my card
Validate my command
    Given I clicked on checkout
    When I tape my informations
    Then I should see my command details
    And I confirm my command