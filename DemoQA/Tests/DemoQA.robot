*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/keywords.robot
Resource    ../Resources/variables.robot

*** Test Cases ***
Scenario : Go to Element page
    Given I am on the main page
    When I click on Element page
    Then I choose the files EXCEPT Office and Excel file.doc

Scenario : Modify Salary
    Given I am on the Web Tables page
    When I modify the informations
    Then I verify the value

Scenario : Tabs
    Given I clicked on Alerts
    When I click on Browser Windows 
    And I create new tab
    Then I close the new tab   

Scenario : Modal Dialog
    Given I am on the Modal Dialog tab
    When I choose large modal
    Then I can find "4" times the "Lorem Ipsum" term

Scenario : Progress Bar
    Given I am on the Progress Bar page
    When I click on "Start"
    Then I should get "100" as a result

Scenario : Items
    Given I clicked on Menu option
    Then I can Choose sub sub item 2

Scenario : Select Menu
    Given I am on the Select Menu tab
    Then I choose the options

Scenario : Search book
    Given I am on the Book Store Application page
    When I search for a Book
    Then I can see it in the results

