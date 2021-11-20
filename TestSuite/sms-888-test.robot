*** Settings ***
Documentation    Suite description
Suite Setup
Suite Teardown
Test Teardown     common.Close Browser
Resource            ../Global/super.robot

*** Test Cases ***
[SMS-888-TEST] - Verify account page fileds
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    click Accounts Link
    Open Active Account
    Open Account Details
    Verify Account Information
    Verify Address Information
    Verify Billing Information
    Verify Contact Information
    Verify Territory Information
    Goto Home page


