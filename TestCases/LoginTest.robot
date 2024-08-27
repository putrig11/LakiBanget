*** Settings ***
Resource        ../Resources/resource.robot
Test Setup         Go to Admin Page
Test Teardown       Close BROWSER
*** Variables ***


*** Keywords ***
Keyword 1
    Create File    ${PATH_Popmama}    Hello World...!!!    encoding=UTF-8

Keyword 2
    ${Test}    Get File    ${PATH_Popmama}    encoding=UTF-8    encoding_errors=strict
    Log To console    ${Test}
    

*** Test Cases ***
    
Test Valid Login
    [Documentation]    Test Untuk Valid Login
    [Tags]    positiftest
    
    Input Username
    Input password
    Click Submit

# Test Invalid Username password
#     [Documentation]    Test Untuk InValid Login
#     [Tags]    negatiftest

#     Click Lanjut Button
#     LoginPage.Input Username     salah@gmail.com
#     LoginPage.Input password     salahpassword
    
#     LoginPage.Click Masuk
#     Verify Email Password Salah
    
    