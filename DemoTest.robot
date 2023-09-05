*** Settings ***
Library     SeleniumLibrary
Library     String
Variables       data.yaml


*** Variables ***


*** Test Cases ***
Change Primary Unit
    open browser        ${base_url}    chrome
    Maximize Browser Window
    wait until page contains element        xpath://body/app-root[1]/div[1]/div[1]/app-login[1]/div[1]/div[2]/div[1]/form[1]  30s
    input text      css:#username   ${login_mail}
    input text      css:#pwd    ${login_pass}
    click button        //body/app-root[1]/div[1]/div[1]/app-login[1]/div[1]/div[2]/div[1]/form[1]/div[4]/mat-spinner-button[1]/button[1]
    Wait Until Page Contains Element        //h2[contains(text(),'Welcome back ${account_creator_name}!')]    30s
    location should be      https://qa.tracextech.com/#/dashboard
    Log     login succesfull
    Click Element       //span[contains(text(),'Settings')]
    Wait Until Element Is Visible       //a[contains(text(),' Admin Settings ')]
    Click Element       //a[contains(text(),' Admin Settings ')]
    Wait Until Page Contains Element        //p[contains(text(),'FARM MANAGEMENT SETTINGS')]
    Click Element       //p[contains(text(),'FARM MANAGEMENT SETTINGS')]/mat-icon
    Wait Until Element Is Visible       //span[contains(text(),'Primary Land Unit :')]
    Scroll Element Into View        //span[contains(text(),'FPO')]
    Click Element       //mat-select[1]
    Wait Until Page Contains Element       //span[contains(text(),'Killa')][@class='mat-option-text']
    Scroll To Element        //span[contains(text(),'Killa')][@class='mat-option-text']
    ${is_visible}       Run Keyword And Return Status       Element Should Be Visible       //span[contains(text(),'Killa')][@class='mat-option-text']
    Click Element       //span[contains(text(),'Killa')][@class='mat-option-text']
    Mouse Down      //button[3]
    Click Element       //button[3]
    ${is_unit_different}     Run Keyword And Return Status       Wait Until Element Is Visible       //button[contains(text(),'Yes')]   2s
    IF    ${is_unit_different}
    Click Button        //button[contains(text(),'Yes')]
    END
    Click Element       //span[contains(text(),'Dashboard')]
    Wait Until Page Contains Element        //span[contains(text(),'Mapped Area')]
    ${element_text}     Get Text     //span[contains(text(),'Mapped Area')]/following-sibling::span[2]
    @{list}        Split String        ${element_text}
    ${required_text}        Set Variable    ${list}[1]
    ${boolean}      Run Keyword And Return Status      Should Be Equal As Strings      killa   ${required_text}
    IF    ${boolean}
        Log     Primary Unit Change Successfull
    ELSE
        Log     Primary Unit Change Unsuccessfull
        Fail        Primary Unit Change Unsuccessful
    END
    close browser

*** Keywords ***
Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})