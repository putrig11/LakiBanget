*** Settings ***
Resource    ../resource.robot

*** Variables ***
${UsernameTextBox}    id=user_login
${passwordTextBox}    id=user_pass
${buttonSubmit}       id=wp-submit
${errormessage}        id=login_error

*** Keywords ***
Verify on Login Page
    Page Should Contain Element    ${UsernameTextBox}

Input Username
    [Arguments]    ${name_login}=${ADMIN USER}
    Input Text    ${UsernameTextBox}    ${namelogin}

Input password
    [Arguments]    ${password_login}=${ADMIN PASSWORD}
    Input Text    ${passwordTextBox}    ${password_login}

Verify Email Password Salah
    Wait Until Element Is Visible    ${errormessage}    timeout=3
    ${message}=   GET Text   ${errormessage}
    Should Be Equal   ${message}   Email atau password salah!

Click Submit
    Click Element    ${buttonSubmit}

Login To LakiBanget
    [Arguments]        ${name_login}=${ADMIN USER}    ${password_login}=${ADMIN PASSWORD}
    Input Username    ${name_login}
    Input password    ${password_login}
    Click Submit
