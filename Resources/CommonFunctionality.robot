*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Go to Admin Page
    Open browser    ${URL ADMIN}    ${BROWSER}

Go to googledrive
    Open browser    https://docs.google.com/spreadsheets/d/1Ep1OiYTpRDouvbzax1zqceQBhh-H0Cf4RlMqYEeRXY0/edit#gid=152318204    ${BROWSER}

# Verify Lanjut Button
#     ${lanjutbutton}=        Set Variable    //button[@class='action js-confirm']
#     Page Should Contain Element          xpath=${lanjutbutton}

# Click Lanjut Button
#     ${lanjutbutton}=        Set Variable    //button[@class='action js-confirm']
#     Click Element        xpath=${lanjutbutton}

Finish Test
    Close browser

Scroll Element Vertical Into View
    [Arguments]    ${end_element}
    [Documentation]    Fungsi ini digunakan untuk scroll halaman web vertikal berdasarkan point atau titik
        ...            loading akan berhenti ketika end element telah di temukan atau end_point telah habis

    ${end_point}       Set Variable    ${20}

    #${post}=    Get Vertical Position    ${end_element}
    FOR    ${i}    IN RANGE    ${end_point}
        ${start}=            evaluate        ${i}*${300}
        ${end}=              evaluate        ${i}*${300}+${300}
        Execute Javascript        window.scrollTo(${start},${end})
        ${element_found}         ${value}=      Run Keyword and Ignore Error    Element Should Be Focused    ${end_element}
        Exit FOR Loop If         '${element_found}'=='PASS'
    END

Scroll Element Into View X    
     [Arguments]        ${Element}
     Scroll Element Into View         ${Element}
     Wait Until Element is visible    ${Element}    timeout=5s
     Set Focus To Element    ${Element}
     ${post}=    Get Vertical Position    ${Element}
     Execute Javascript    window.scrollTo(${post-200},${post-100})