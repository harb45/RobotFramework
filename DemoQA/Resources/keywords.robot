*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resources/variables.robot
Resource    ../Resources/CustomizedKeyword.resource

*** Keywords ***
I am on the main page
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Title Should Be    DEMOQA

I click on Element page
    Click Element    //h5[text()='Elements']
    Element Should Be Visible   //span[text()='${checkBox}']
    Click and Verify    ${checkBox}

I choose the files EXCEPT Office and Excel file.doc
    Click Element    //button[@title='Expand all']
    Click Radio    Home
    Scroll Element Center
    Click Radio    Office
    Click Radio    Excel File.doc
    
I am on the Web Tables page
    Click and Verify    Web Tables

I modify the informations
    Click and Wait    ${secSalary}
    Click and Wait    ${thirdSalary}
    Click Element    //span[@id='edit-record-1']
    Wait Until Element Is Visible    //form[@id='userForm']
    Input Text    //input[@id="salary"]    4300
    Click Button    //button[@id="submit"]

I verify the value
    ${salary}    Get Text    //div[@class='rt-td'][5]
    Should Be Equal    ${salary}    4300
    Click Element    ${element} 

I clicked on Alerts
    Click Menu    Alerts, Frame & Windows
    Wait Until Element Is Visible    //span[text()='${browser}']

I click on Browser Windows 
    Click and Verify    ${browser}

I create new tab
    Click Button    //button[@id="tabButton"]

I close the new tab
    ${windowhandles}    Get Window Handles
    Switch Window    ${windowhandles}[1]
    Close window
    Switch Window    ${windowhandles}[0]

I am on the Modal Dialog tab
    Click and Verify    Modal Dialogs

I choose large modal
    Click Button    //button[@id="showLargeModal"]
    Wait Until Element Is Visible    //div[@class="modal-content"]

I can find "${number}" times the "${text}" term
    ${content}    Get Text    //div[@class="modal-body"]
    ${occurences}    Count Substring In Text    ${content}    ${text}
    ${number}    Convert To Integer    ${number}
    Should Be Equal As Integers    ${occurences}    ${number}
    Click Button    //button[@id="closeLargeModal"]

I am on the Progress Bar page
    Click Menu    Widgets
    Wait Until Element Is Visible    //span[text()='${progressBar}']
    Click and Verify    ${progressBar}

I click on "${button}"
    Click Button    //button[text()='${button}']

I should get "${pourcentage}" as a result
    ${progression}    Wait Until Keyword Succeeds    10x    1s    Progress Bar Should Be Complete
    ${progression}    Convert To Integer    ${progression}
    Should Be Equal As Integers    ${progression}    ${pourcentage}

I clicked on Menu option
    Scroll Element Center
    Click and Verify    Menu

I can Choose sub sub item 2
    Mouse Over    //ul[@id='nav']/li[2]
    Wait Until Element Is Visible    ${subList}
    Mouse Over    ${subList}
    Wait Until Element Is Visible    ${subItem}
    Click Element    ${subItem}
    
I am on the Select Menu tab
    Scroll Element Center
    Click and Verify    Select Menu

I choose the options
    Select Options   Select Option    ${another}
    Select Options    Select Title    ${other}
    Select From List By Label    //select[@id='oldSelectMenu']    Aqua
    Select Options    Select...    ${redChoice}
    Click Element    ${blackChoice}

I am on the Book Store Application page
    Click Menu    Widgets
    Click Menu    Book Store Application
    Wait Until Element Is Visible    ${bookStore}
    Click Element    ${bookStore} 
    Wait Until Element Is Visible    ${search}
    Element Should Be Visible    //div[@class='rt-table']

I search for a Book
    Click Element    ${search}
    Input Text    ${search}    ${bookName}

I can see it in the results
    ${book}    Get Text    //div[@class="rt-td"][3]
    Should Be Equal    ${book}    ${bookName}