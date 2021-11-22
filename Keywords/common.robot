*** Settings ***
Documentation    All the commonly used keywords are available here
Resource          ../Global/super.robot

*** Keywords ***
Launch Browser
    [Arguments]    ${browser_name}    ${url}
    Run Keyword If    '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Open Chrome Browser    ${url}
    Run Keyword If    '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    Open Browser    ${url}    Firefox

Launch Browser and Navigate to URL
    [Arguments]    ${url}    ${browser_name}
    ${session}    Run Keyword And Return Status    Get Session Id
    Run Keyword If    ${session}==True    Go To    ${url}
    ...    ELSE    Launch Browser    ${browser_name}    ${url}
    Maximize Browser Window
    Wait Until Time    2

Take Screenshot
    Capture Page Screenshot

Set Browser Position
    [Arguments]    ${browser_name}
    Run Keyword If    '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Set Window Position    0    5
    Run Keyword If    '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    Set Window Position    1005    6
    Set Window Size    959    1047

Create Screenshot Directory
    Run Keyword And Ignore Error    Create Directory    ${EXECDIR}/Screenshots
    Selenium2Library.Set Screenshot Directory    ${EXECDIR}/Screenshots

Wait Until Element Clickable and Click
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    14s    2s    Click Element    ${locator}

Fail And Take Screenshot
    [Arguments]    ${error_message}
    Run Keyword And Continue On Failure    Fail    ${error_message}
    Take Screenshot

Create Directories
    Create Screenshot Directory

Update Dynamic Value
    [Arguments]    ${locator}    ${value}
    ${xpath}    Replace String    ${locator}    replaceText    ${value}
    [Return]    ${xpath}

Navigate to Menu
    [Arguments]    ${menu}    ${sub_menu}
    Wait Until Element Is Visible    //span[text()='${menu}']/parent::a    ${LONG_WAIT}    ${menu} is not displayed after waiting ${LONG_WAIT}
    Click Element    //span[text()='${menu}']/parent::a
    Wait Until Element Is Visible    //span[text()='${sub_menu}']/parent::a    ${LONG_WAIT}    ${sub_menu} is not displayed in ${menu} menu list
    Wait Until Element Clickable and Click    //span[text()='${sub_menu}']

Close Browser
    Run Keyword And Ignore Error    Selenium2Library.Close All Browsers

