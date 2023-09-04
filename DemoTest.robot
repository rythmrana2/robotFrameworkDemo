*** Settings ***
Library     SeleniumLibrary


*** Variables ***


*** Test Cases ***
Change Primary Unit
    open browser          chrome
    Maximize Browser Window
    wait until page contains element        xpath://body/app-root[1]/div[1]/div[1]/app-login[1]/div[1]/div[2]/div[1]/form[1]  30s
    input text      css:#username   
    input text      css:#pwd       
    click button        //body/app-root[1]/div[1]/div[1]/app-login[1]/div[1]/div[2]/div[1]/form[1]/div[4]/mat-spinner-button[1]/button[1]
    Wait Until Page Contains Element        //h2[contains(text(),'Welcome back ')]    30s
    location should be      https://qa.tracextech.com/#/dashboard
    Log     login succesfull
    Click Element       //span[contains(text(),'Settings')]
    Wait Until Element Is Visible       //a[contains(text(),' Admin Settings ')]
    Click Element       //a[contains(text(),' Admin Settings ')]
    Wait Until Page Contains Element        //p[contains(text(),'FARM MANAGEMENT SETTINGS')]
    Click Element       //p[contains(text(),'FARM MANAGEMENT SETTINGS')]/mat-icon
    Wait Until Element Is Visible       //span[contains(text(),'Primary Land Unit :')]
    Click Element       //mat-select[1]
    Wait Until Element Is Visible       //span[contains(text(),'Killa')]
    Mouse Down      //span[contains(text(),'Killa')]
    Click Element       //span[contains(text(),'Killa')]
    Mouse Down      //button[3]
    Click Element       //button[3]
    close browser
*** Keywords ***
