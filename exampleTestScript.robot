*** Settings ***
Documentation   Exapmle test case to verify RobotFramework
Library     SeleniumLibrary

*** Variables ***
${url}  https://www.python.org
${browser}  Chrome
${delay}    2
${imgXpath}     xpath=//*[@id="touchnav-wrapper"]/header/div/h1/a/img

*** Test Cases ***
[TestCase-DPT]-Display page Title
    Launch Python Page
    Waiting Period
    Page Should be Opened
    Print Title
    Complete Task

*** Keywords ***
Launch Python Page
    Open Browser    ${url}  ${browser}
    Maximize Browser Window

Waiting Period
    Set Selenium Speed  ${delay}

Page Should be Opened
    Page Should Contain Image   ${imgXpath}

Print Title
    Get Title

Complete Task
    Close Browser