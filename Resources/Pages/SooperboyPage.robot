
*** Keywords ***
Sooperboy Grooming
    Go to         http://www.sooperboy.com/grooming/

    ${jumlah_halaman}=        set Variable        ${5}

    FOR    ${j}    IN RANGE    ${jumlah_halaman}
        ${j}=    evaluate       ${j}+${1}
        Go To         http://www.sooperboy.com/grooming/grooming/index${j}.html
        Log To console        loop halaman j ${j}
        Loop Untuk Save artikel Sooperboy    ${j}

    END

Set image Sooperboy
    ${img}              Get Element Attribute     xpath=//div[@class='img-detail']/img        src
    Set Global Variable      ${img}

Get And Input To New Article Sooperboy
    Wait Until Element Is Visible        xpath=//div[@class='headline-artikel']/h1

    ${IsElementVisible}=      Run Keyword And Return Status    Element Should Be Visible       xpath=//div[@class='img-detail']/img
    Run Keyword If    ${IsElementVisible}  Set Image Sooperboy

    ${source_url}       get location
    ${dttitle}          get text   xpath=//div[@class='headline-artikel']/h1
    ${dtbody}           get text   xpath=//div[@class='deskrip-detail']

    #Paste To LakiBanget
    Go to       ${URL ADMIN}
    AdminPage.Input New Article    ${dttitle}    ${img} ${dtbody} ${source_url}

Loop Untuk Save Artikel Sooperboy
    [Arguments]        ${idx}
    ${i}=    set Variable    ${1}
    ${jumlah_artikel}=        set Variable        ${10}

    FOR    ${i}    IN RANGE    ${jumlah_artikel}
        ${i}=    evaluate       ${i}+${1}
        Log To console        artikel i ${i}
        Wait Until Element Is Visible        xpath=//div[@class='sb-content']
        Scroll Element Into View             xpath=//ul[@class='list-related clearfix']/li[${i}]
        Click Element                        xpath=//ul[@class='list-related clearfix']/li[${i}]
        Get And Input To New Article Sooperboy
        Go To         http://www.sooperboy.com/grooming/grooming/index${idx}.html

    END

